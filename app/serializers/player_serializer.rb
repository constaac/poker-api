class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_hands, :vpip, :pfr, :"3b", :f3b, :user_id
  # has_one :user
  # ^ Whats going on here
end
