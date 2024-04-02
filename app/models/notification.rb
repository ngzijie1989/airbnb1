class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true
  belongs_to :listing, optional: true
end
