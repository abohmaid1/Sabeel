class SupportedGovernate < ApplicationRecord
    has_many :users, foreign_key: :location, class_name: 'User'
    has_many :creating_meeting_place_request, foreign_key: :governate, class_name: 'CreatingMeetingPlaceRequest'
end