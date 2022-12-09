class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
    insta = Insta.find(params[:insta_id])
    comment = insta.comments.build(comment_params) 
    comment.user_id = current_user.id
    if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) 
    else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) 
    end
end

def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
        redirect_back(fallback_location: root_path)
    else
        flash.now[:alert] = 'コメント削除に失敗しました'
        render insta_path(@insta)
    end
end

private
    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id, insta_id: params[:insta_id])
    end
end

