class InstasController < ApplicationController
    before_action :authenticate_user!

    def index
        @instas = Insta.all
    end

    def new
        @insta = Insta.new 
    end

    def create
        insta = Insta.new(insta_params)
        insta.user_id = current_user.id
        if insta.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @insta = Insta.find(params[:id])
        @comments = @insta.comments
        @comment = Comment.new
    end

    def edit
        @insta = Insta.find(params[:id])
    end

    def update
        insta = Insta.find(params[:id])
        if insta.update(insta_params)
            redirect_to :action => "show", :id => insta.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        insta = Insta.find(params[:id])
        insta.destroy
        redirect_to action: :index
    end
    
    private
    def insta_params
        params.permit(:body,:image)
    end
end
