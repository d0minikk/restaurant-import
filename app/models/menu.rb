class Menu < ApplicationRecord
  has_many :menu_pages

  belongs_to :sponsor, optional: true
  belongs_to :event, optional: true
  belongs_to :venue, optional: true
  belongs_to :place, optional: true
  belongs_to :occasion, optional: true
  belongs_to :location, optional: true
end
