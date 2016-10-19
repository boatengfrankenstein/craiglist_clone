class Listing < ApplicationRecord
  belongs_to :category, dependent: :destroy
end
