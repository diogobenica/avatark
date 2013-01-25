class Avatar
  include HTTParty

  FACEBOOK_DOMAIN = 'https://graph.facebook.com'
  TWITTER_DOMAIN = 'http://api.twitter.com/1'

  def initialize(username)
  	@username = username
  end

  def twitter
  	self.class.base_uri TWITTER_DOMAIN
  	response = get_image "users/profile_image/#{@username}?size=original&redirect=false"
    JSON.parse(response.parsed_response.to_json)["profile_image_url"]
  end

  def facebook
    self.class.base_uri FACEBOOK_DOMAIN
    response = get_image "/#{@username}/picture?type=large&redirect=false"
    JSON.parse(response.parsed_response.to_json)["data"]["url"]
  end

  private

  def get_image(resource)
  	self.class.get resource
  end
end
