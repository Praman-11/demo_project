
class Ability
  include CanCan::Ability

  def initialize(user)
      if user.type =='Customer'
      # can [:create, :update, :destroy], User, user: user
      can [:read], Service, user_id: user.id
      can [:create],Rating, service_id: user.id
      elsif user.type == 'Admin'
      # can [:show], User, id: user
      can [:create, :update, :destroy], Service, admin_id: user.id
    end
  end
end
