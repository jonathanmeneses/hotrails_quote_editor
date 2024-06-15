class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  belongs_to :company

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
