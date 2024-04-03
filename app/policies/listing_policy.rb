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

  def viewing?
    record.user == user
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

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
