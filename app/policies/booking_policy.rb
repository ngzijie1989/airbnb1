class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.where(buyer_id: @user.id)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.buyer == user
  end
end
