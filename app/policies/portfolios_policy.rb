class PortfoliosPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.has_role? :admin
        scope.all
      else
false
      end
    end
  end

 

  def index?
    @user.has_any_role? :admin,:newuser
  end

  def edit?
    update?
  end

  def update?
    @user.has_role? :admin
  end
end
