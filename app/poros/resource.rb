# Is a web resource of any kind
class Resource
  def initialize(url, body = nil)
    @url = url
    @body = body
  end

  def find_broken_links
    puts @url
    cast.find_broken_links&.flatten&.compact
  end

  private

  def broken?
    body.nil?
  end

  def body
    @body ||= response.body
  end

  def cast
    if html?
      HtmlPage.new(@url, body)
    else
      GenericResource.new(@url, body)
    end
  end

  def i_am_broken
    puts "Broken: #{@url}"
    [self]
  end

  def i_am_not_broken
    []
  end

  def response
    @response ||= HttpRequest.new(@url).go
  end

  def html?
    response.html?
  end
end
