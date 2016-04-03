class Item < ActiveRecord::Base
  belongs_to :user

  def completed?
  	!completed_at.blank?
  	# An item is completed if the item is not blank(not null)
  end
end
