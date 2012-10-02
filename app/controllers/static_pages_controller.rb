class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact_list
    if signed_in?
      @users  = User.paginate(page: params[:page], per_page: 10)
    end
  end
end
