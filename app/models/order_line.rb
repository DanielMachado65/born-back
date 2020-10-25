# frozen_string_literal: true

# classe de listas de pedidos e produtos
class OrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
