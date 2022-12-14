class Author < ApplicationRecord
  has_and_belongs_to_many :books, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
