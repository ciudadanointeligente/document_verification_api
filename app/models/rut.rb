class Rut < ApplicationRecord
  validates_presence_of :rut
  validates_uniqueness_of :rut
end
