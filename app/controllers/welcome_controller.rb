class WelcomeController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @registrations = current_user.registrations.where(status:1)
  end
end
  