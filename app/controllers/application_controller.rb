class ApplicationController < ActionController::Base
  before_action :authenticate_photographer!

  protect_from_forgery with: :exception
end
