class RoomsController < ApplicationController
  before_action :require_current_user

  def show
    @messages = Message.all
  end
end
