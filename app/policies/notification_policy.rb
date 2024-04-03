class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.includes(listing: { photos_attachments: :blob }).where(user: user).where(read: false)
    end
  end
  
  def show?
    record.user == user
  end
end
