class BadgesController < ApplicationController

  def index
    @badges = ListBadge.all
  end

  def search
    @badges = Badge.where(user_id: current_user.id)
  end

end
