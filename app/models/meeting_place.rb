class MeetingPlace < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :database_authenticatable, 
        :recoverable, :rememberable, :validatable

  has_many :book_requests, foreign_key: :meeting_place_id
  has_many :requests_logs
end
