class ApplicationController < ActionController::Base
  include CurrentUserHandler

  protect_from_forgery
end
