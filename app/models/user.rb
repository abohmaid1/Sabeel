class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable

  validates :username, :presence => true
  validates :location, :presence => true


  has_many :user_have_books, dependent: :destroy
  has_many :supported_governates
  has_many :books, through: :user_have_books

  enum role: [:special, :reader, :writer]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :reader
  end
end
