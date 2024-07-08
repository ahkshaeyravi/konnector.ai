class Api::V1::UsersController < ApplicationController

    include Filterable

    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render json: @users.as_json(only: [:id, :name, :email]), status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    def filter
        filtered_users = filter_users
        render json: filtered_users, status: :ok
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
    end

end
