class Book < ApplicationRecord

    has_many :user_have_books,  dependent: :destroy
    has_many :users, through: :user_have_books, dependent: :destroy
    accepts_nested_attributes_for :user_have_books

    scope :filter_by_title,-> (title) { where('title ILIKE ?', "%#{title}%") }    
end
