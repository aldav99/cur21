class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def search
    @badges = current_user.badges
  end

end
