# frozen_string_literal: true

# classe de categoria
class Category < ApplicationRecord
  has_many :products
end
