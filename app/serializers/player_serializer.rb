class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :hand_count, :call_preflop, :raise_preflop, :call_or_raise_preflop, :reraise_preflop, :call_to_reraise_preflop, :fold_on_reraise_preflop
  # has_one :user
end
