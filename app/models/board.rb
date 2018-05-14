class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pinnings
  has_many :pins, through: :pinnings

  validates_presence_of :name, :user_id
  validates_uniqueness_of :name, scope: :user_id
end
