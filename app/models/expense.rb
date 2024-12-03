class Expense < ApplicationRecord
  validates :date, presence: true
  validates :payment, presence: true, numericality: { greater_than: 0 }
end
