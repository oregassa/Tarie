class Item < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}


  def completed?
  	!completed_at.blank?
  	# An item is completed if the item is not blank(not null)
  end
end
