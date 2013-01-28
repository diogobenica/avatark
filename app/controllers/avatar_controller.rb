class AvatarController < ApplicationController
  respond_to :json

  before_filter :new_avatar

  def auto
    [:facebook, :twitter].each do |origin|
      @image = @avatar.send origin
      break unless @image[:origin] == 'default'
    end
    respond_with @image
  end

  def facebook
    @image = @avatar.facebook
    respond_with @image
  end

  def twitter
    @image = @avatar.twitter
    respond_with @image
  end

  private

  def new_avatar
  	@avatar = Avatar.new params[:username]
  	@image = {}
  end
end
