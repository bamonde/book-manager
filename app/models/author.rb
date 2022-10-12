class Author < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
