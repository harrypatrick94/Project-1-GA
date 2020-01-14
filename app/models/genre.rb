class Genre < ApplicationRecord
  has_many :songs
  belongs_to :users, optional: true
end
