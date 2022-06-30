class Feature < ApplicationRecord
  belongs_to :product
  validates_presence_of :name
  validates_presence_of :status
end
