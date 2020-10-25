# frozen_string_literal: true

# classe de pedido
class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :products, through: :order_lines

  enum payment_type: %i[pending approved rejected]

  before_create :generate_hash

  def total
    products.sum(:price)
  end

  def generate_hash
    self.order_hash = [*('A'..'Z'), *('0'..'9')].sample(8).join
  end
end
