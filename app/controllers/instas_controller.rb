class InstasController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        @insta = Insta.new
    end
end
