class PostingsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @posting = current_user.postings.build(params[:posting])
    if @posting.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render 'group_app/home'
    end
  end
  def destroy
  end
end