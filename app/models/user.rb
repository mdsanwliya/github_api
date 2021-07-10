class User < ApplicationRecord
  validates :uid, :email, :name, presence: true
  validates :uid, uniqueness: true
end
