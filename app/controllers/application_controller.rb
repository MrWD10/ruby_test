class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:edit, :update]

include DeviseWhitelist
include Pundit
include SetSource
include CurrentUserConcern
include DefaultPageContent



rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to(request.referrer || root_path)
end
end
