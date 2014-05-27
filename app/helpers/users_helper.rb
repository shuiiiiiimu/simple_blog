module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=143"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def gravatar_for_header(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}/?s=23"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def find_username_by_id(user_id)
    return User.find(user_id).name
  end

end
