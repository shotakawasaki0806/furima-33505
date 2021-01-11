class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :wait

  with_options presence: true do
  validates :product
  validates :explanation 
  validates :image
  validates :price, format: {with: /\d/}
  validates :price, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999}
  end
  validates :category_id, :state_id, :postage_id, :area_id, :wait_id, numericality: { other_than: 1 }
end
