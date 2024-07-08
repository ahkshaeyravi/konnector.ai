# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed sample user data into users table
User.create([{name: "John", email: "john@gmail.com", campaigns_list: [{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam2", "campaign_id": "id2"}]},
             {name: "Jane", email: "jane@gmail.com", campaigns_list: [{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam3", "campaign_id": "id3"}]}])
