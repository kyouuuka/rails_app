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
    end

    private
    def insta_params
        params.permit(:body,:image)
    end
end
