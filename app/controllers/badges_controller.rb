class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def achievements
    @badges = current_user.badges
  end

end
