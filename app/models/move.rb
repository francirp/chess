class Move < ActiveRecord::Base
  attr_accessible :from, :to, :game_id
  
  belongs_to :game
end
