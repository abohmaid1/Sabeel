class Book < ApplicationRecord

    has_many :user_have_books, dependent: :destroy
    has_many :users, through: :user_have_books
    accepts_nested_attributes_for :user_have_books

    has_one_attached :cover

    scope :filter_by_title,-> (title) { where('title ILIKE ?', "%#{title}%") }    
end
