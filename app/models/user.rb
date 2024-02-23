class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable

  validates :username, :presence => true
  validates :location, :presence => true


  has_many :user_have_books, dependent: :destroy
  has_many :paragraphs,  dependent: :destroy, foreign_key: 'writer_id'
  belongs_to :supported_governate, foreign_key: :location, class_name: 'SupportedGovernate'
  has_many :books, through: :user_have_books
  has_many :book_requests, dependent: :destroy, foreign_key: :requester_id
  has_many :change_user_type_requests, dependent: :destroy
  has_many :followers, foreign_key: :follower_id, dependent: :destroy
  has_many :followers, foreign_key: :followed_id, dependent: :destroy


  enum role: [:special, :reader, :writer]
  
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :reader
  end
end
