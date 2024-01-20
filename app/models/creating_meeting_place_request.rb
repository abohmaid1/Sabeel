class CreatingMeetingPlaceRequest < ApplicationRecord
    belongs_to :supported_governate, foreign_key: :governate, class_name: 'SupportedGovernate'
    has_one_attached :contract
end
