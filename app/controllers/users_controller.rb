class UsersController < ApplicationController
    
    include Filterable

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def filter
    
    end

    def new
     @user = User.new
    end

    def create

       @user = User.new(user_params)
       @user.campaigns_list = JSON.parse(params[:user][:campaigns_list]) if params[:user][:campaigns_list].present?

       respond_to do |format|
            if @user.save!
                format.html { redirect_to root_path, notice: "Yay!, User Was Successfully Created" }
            else
                msg = @user.errors.full_messages.join(',')
                redner 'new'
            end
        end
    
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
    
end
