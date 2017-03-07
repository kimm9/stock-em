class Portfolio < ApplicationRecord
  has_and_belongs_to_many :stocks
  belongs_to :user
end
