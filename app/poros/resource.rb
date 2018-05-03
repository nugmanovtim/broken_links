# Is a web resource of any kind
class Resource
  attr_reader :url
  def initialize(inspector, url, body = nil)
    @inspector = inspector
    @url = URI(url)
    @body = body
  end

  def find_broken_links
    return [] unless first_time?
    download
    return i_am_broken if broken?
    if html?
      return i_am_not_broken unless @inspector.correct_host?(@url.host)
      HtmlPage.new(@inspector, @url, body).find_broken_links
    else
      i_am_not_broken
    end
  end

  private

  def first_time?
    return false if @inspector.visited? @url
    @inspector.mark_as_visited @url
    true
  end

  def download
    response
  end

  def broken?
    response.not_found?
  end

  def body
    @body ||= response.body
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
