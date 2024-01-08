module UserHelper
  def user_image_url(user, size: nil)
    return user.image unless size

    uri = URI.parse(user.image)
    new_query_ar = URI.decode_www_form(uri.query || "") << [ "s", size ]
    uri.query = URI.encode_www_form(new_query_ar)

    uri.to_s
  end
end
