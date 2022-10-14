# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Running seeds'

(1..5).each { Publisher.create(name: Faker::Book.publisher) }
(1..10).each { Author.create(name: Faker::Book.author) }

publishers = Publisher.all
authors = Author.all

(1..30).each do
  book = Book.create(
    title: Faker::Book.title,
    genre: Faker::Book.genre,
    edition: (1..4).to_a.sample,
    release_date: (1..36).to_a.sample.months.ago,
    isbn: Faker::Number.number(digits: 10),
    iccn: Faker::Number.number(digits: 4),
    oclc: Faker::Number.number(digits: 8),
    publisher: publishers.sample,
    authors: [authors.sample, authors.sample],
  )

  filename = "book-#{(1..5).to_a.sample}.jpg"
  book.cover.attach(io: File.open(Rails.root.join('db', 'support', filename)), filename: filename)
end
