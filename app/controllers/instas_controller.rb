class InstasController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        @insta = Insta.new 
    end

    def create
        insta = Insta.new(insta_params)
        if insta.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    
    private
    def insta_params
        params.permit(:body,:image)
    end
end
