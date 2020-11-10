# frozen_string_literal: true

# classe de categoria
class Category < ApplicationRecord
  has_many :products

  scope :by_name, ->(name) { where(name: name) }
end
