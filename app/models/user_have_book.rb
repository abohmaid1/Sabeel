class UserHaveBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :book_requests, foreign_key: :Requested_book_id

end
