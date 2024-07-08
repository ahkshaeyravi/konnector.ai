class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users.as_json(only: [:id, :name, :email])
    end

    def create
    end

    def filter_users
    end

end
