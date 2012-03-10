class PostingsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end

  def create
    @posting = current_user.postings.build(params[:posting])
    if @posting.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
	  @feed_items = []
      render 'group_app/home'
    end
  end
  
  def destroy
      @posting.destroy
    redirect_back_or root_path
  end
  
    private

    def correct_user
      @posting = current_user.postings.find_by_id(params[:id])
      redirect_to root_path if @posting.nil?
    end
	
end