class Avatar
  include HTTParty

  FACEBOOK_DOMAIN = 'https://graph.facebook.com'
  TWITTER_DOMAIN = 'http://api.twitter.com/1'

  def initialize(username)
  	@username = username
  end

  def twitter
  	self.class.base_uri TWITTER_DOMAIN
  	response = get_image "/users/profile_image/#{@username}?size=original&redirect=false"
    unless response.index("body")
      parsed_json = JSON.parse(response.parsed_response.to_json)
      parsed_json["profile_image_url"] unless parsed_json["error"]
    else
      default_avatar
    end
  end

  def facebook
    self.class.base_uri FACEBOOK_DOMAIN
    response = get_image "/#{@username}/picture?type=large&redirect=false"
    parsed_json = JSON.parse(response.parsed_response.to_json)
    unless parsed_json["error"]
      parsed_json["data"]["url"]
    else
      default_avatar
    end
  end

  private

  def get_image(resource)
  	self.class.get resource
  end

  def default_avatar
    "http://wiseheartdesign.com/page_attachments/0000/0062/default-avatar.png"
  end
end
