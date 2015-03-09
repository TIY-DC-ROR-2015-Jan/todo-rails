class Todo < ActiveRecord::Base
  belongs_to :list

  validates :list, presence: true
  validates :description, presence: true, uniqueness: { scope: :list }

  def complete?
    completed_at.present?
  end

  def complete!
    update completed_at: Time.now
  end
end
