class List < ActiveRecord::Base
  belongs_to :user

  has_many :todos, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, uniqueness: { scope: :user }
end
