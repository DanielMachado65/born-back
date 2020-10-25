# frozen_string_literal: true

# classe de produto
class Product < ApplicationRecord
  belongs_to :category

  has_many :order_lines, dependent: :destroy
  has_many :orders, through: :order_lines
end
