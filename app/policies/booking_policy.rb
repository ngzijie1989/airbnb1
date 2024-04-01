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

  def sendreminder?
    record.buyer == user
  end

  def reviewbooking?
    record.lister == user
  end

  def approve?
    record.lister == user
  end

  def reject?
    record.lister == user
  end

  def destroy?
    record.lister == user
  end

  def cancel?
    record.lister == user
  end

  def cancelconfirm?
    record.lister == user
  end
end
