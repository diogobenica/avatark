class AvatarController < ApplicationController
  respond_to :json

  before_filter :new_avatar

  def facebook
    @image_url[:avatar] = @avatar.facebook
    respond_with @image_url
  end

  def twitter
    @image_url[:avatar] = @avatar.twitter
    respond_with @image_url
  end

  private

  def new_avatar
  	@avatar = Avatar.new params[:username]
  	@image_url = {}
  end
end
