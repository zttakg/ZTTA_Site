module ApplicationHelper
  include TemirtulparHelper

  def url_constructor(url, count)
    symbol = url.scan(/[?]/).present? ? '&' : '?'

    url + symbol + 'page=' + count.to_s
  end

  def md5(value)
    Digest::MD5.hexdigest(value)
  end

  def contacts
    Contact.first
  end
end
