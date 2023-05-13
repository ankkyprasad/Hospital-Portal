class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
    @userable_type = current_user.userable_type
    @userable = current_user.userable
  end
end