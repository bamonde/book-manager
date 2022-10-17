class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :authors, dependent: :destroy

  has_one_attached :cover

  after_commit :add_default_cover, on: [:create, :update]

  validates :title, presence: true
  validates :genre, presence: true
  validates :release_date, presence: true
  validates :edition, presence: true
  validates :publisher_id, presence: true

  def authors_name
    authors.map(&:name)
  end

  def remove_cover
    @remove_cover || false
  end

  def remove_cover=(remove_cover)
    @remove_cover = [TrueClass, FalseClass].include?(remove_cover.class) ? remove_cover : remove_cover == "1"
  end

  private

  def add_default_cover
    if @remove_cover || !self.cover.attached?
      @remove_cover = false
      self.cover.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'book-default.png')), filename: 'book-default.png' , content_type: "image/png")
    end
  end
end
