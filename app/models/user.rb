class User < ApplicationRecord

    validates_uniqueness_of :email
    
    scope :filter_by_campaign_name, ->  (name) {
        where("JSON_CONTAINS(campaigns_list, ?)", { campaign_name: name }.to_json)
    }

end
