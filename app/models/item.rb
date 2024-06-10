class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
s
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: true

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :shipping_from_id
      validates :shipping_days_id
    end
  end
end
