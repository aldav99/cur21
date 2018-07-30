class Admin::ListBadgesController < ApplicationController

before_action :set_list_badges, only: %i[ index ]
before_action :find_list_badge, only: %i[ show edit update destroy]

  def index
    
  end

  def show
    
  end

  def new
    @list_badge = ListBadge.new
  end

  def edit;end

  def create
    @list_badge = ListBadge.new(list_badge_params)
    
    if @list_badge.save
      redirect_to [:admin, @list_badge], notice: t('.success')
    else
      render :new
    end
  end

  def update

    if @list_badge.update(list_badge_params)
      redirect_to [:admin, @list_badge]
    else
      render :edit
    end
  end

  def destroy
    @list_badge.destroy
    redirect_to admin_list_badges_path
  end


  private

  def set_list_badges
    @list_badges = ListBadge.all
  end

  def find_list_badge
    @list_badge = ListBadge.find(params[:id])
  end


  
  def list_badge_params
    params.require(:list_badge).permit(:title, :imgfile, :category_id, :level, :try )
  end

end

