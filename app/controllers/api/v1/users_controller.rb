class Api::V1::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        puts @users.class
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
        filter_string = params[:campaign_names] if params[:campaign_names].present?
        filters = filter_string.split(",")
        filter_results = {}
        filters.each do |filter|
            users =  User.filter_by_campaign_name(filter)
            filter_results[filter] = users.as_json(only: [:id, :name, :email])
        end
        render json: filter_results, status: :ok
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
    end

end
