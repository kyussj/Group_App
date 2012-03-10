class GroupAppController < ApplicationController
  def home
    if signed_in?
      @posting  = current_user.postings.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
