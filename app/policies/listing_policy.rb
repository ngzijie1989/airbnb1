class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.includes(photos_attachments: :blob).where.not(user: user)
    end
  end

  def show?
    true
  end

  def bookedlistingshow?
    true
  end

  def addfavorites?
    true
  end

  def new?
    true
  end
end
