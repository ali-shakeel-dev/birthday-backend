class Wish < ApplicationRecord
  belongs_to :user

  validates :name, :email, :birthday, :time, :style, presence: true
end
