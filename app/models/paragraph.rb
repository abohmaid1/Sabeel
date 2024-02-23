class Paragraph < ApplicationRecord
  belongs_to :user, foreign_key: 'writer_id'
end
