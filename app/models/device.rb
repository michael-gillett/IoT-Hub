class Device < ActiveRecord::Base
  validates_uniqueness_of :applianceId
end
