class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.includes(photos_attachments: :blob).all
    end
  end

  def show?
    true
  end
end
