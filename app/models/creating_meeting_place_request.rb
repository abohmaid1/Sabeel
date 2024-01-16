class CreatingMeetingPlaceRequest < ApplicationRecord
    has_many :supported_governates
    has_one_attached :contract
end
