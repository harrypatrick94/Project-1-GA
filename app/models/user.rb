class User < ApplicationRecord
  has_many :genres

  has_secure_password
end
