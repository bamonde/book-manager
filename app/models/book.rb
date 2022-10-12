class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :authors

  has_one_attached :cover

  validates :title, presence: true
  validates :genre, presence: true
  validates :release_date, presence: true
  validates :edition, presence: true
  validates :publisher, presence: true
end
