module Filterable
  
  extend ActiveSupport::Concern

  def filter_users
    filter_string = params[:campaign_names] if params[:campaign_names].present?
        filters = filter_string.split(",")
        filter_results = {}
        filters.each do |filter|
            users =  User.filter_by_campaign_name(filter)
            filter_results[filter] = users.as_json(only: [:id, :name, :email, :campaign_lists])
        end
        filter_results
  end

end
