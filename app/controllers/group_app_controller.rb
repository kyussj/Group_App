class GroupAppController < ApplicationController
  def home
    @posting = current_user.postings.build if signed_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
