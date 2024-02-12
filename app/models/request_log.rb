class RequestLog < ApplicationRecord
  belongs_to :first_side, class_name: 'User'
  belongs_to :second_side, class_name: 'User'
  belongs_to :first_side_book, class_name: 'Book'
  belongs_to :second_side_book, class_name: 'Book'
  belongs_to :meeting_place, class_name: 'MeetingPlace'
end
