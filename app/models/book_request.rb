class BookRequest < ApplicationRecord
  belongs_to :requester_id, class_name: 'User'
  belongs_to :requested_book_id,  class_name: 'UserHaveBook'
  belongs_to :meeting_place_id, class_name: 'MeetingPlace'

  enum state: [:"معلق", :"قبول", :"مرفوض"]
  
  after_initialize :set_default_state, :if => :new_record?
  def set_default_state
    self.state ||= :معلق
  end
end
