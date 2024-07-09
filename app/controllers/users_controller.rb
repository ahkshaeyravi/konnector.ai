class UsersController < ApplicationController
    
    include Filterable

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def filter
        @filtered_users = filter_users
    end

    def new
        @user = User.new
    end

    def create
       @user = User.new(user_params)
       @user.campaigns_list = JSON.parse(params[:user][:campaigns_list]) if params[:user][:campaigns_list].present?

       if @user.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
    
end
