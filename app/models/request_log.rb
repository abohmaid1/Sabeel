class RequestLog < ApplicationRecord
  belongs_to :first_side
  belongs_to :second_side
  belongs_to :first_side_book
  belongs_to :second_side_book
  belongs_to :meeting_place
end
