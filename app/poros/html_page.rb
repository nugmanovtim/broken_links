# Resource that is an HTML page
class HtmlPage < Resource
  def initialize(url, body)
    super
    @doc = Nokogiri.HTML(body)
  end

  def find_broken_links
    return i_am_broken if broken?
    resources.map(&:find_broken_links)
  end

  private

  def resources
    links.map { |link| Resource.new(@url + URI.escape(link.strip)) }
  end

  def links
    @doc.css('*').map { |e| e['href'] || e['src'] }.compact
  end
end
