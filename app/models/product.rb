class Product < ApplicationRecord
  has_many :features
  validates_presence_of :name
  validates_presence_of :labels_limits
  validates_presence_of :carriers_limit
  validates_presence_of :expired_at
  validates_presence_of :started_at
  validates_presence_of :status
end