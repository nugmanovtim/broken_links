# Resource that is an HTML page
class HtmlPage < Resource
  def initialize(inspector, url, body)
    super
    @doc = Nokogiri.HTML(body)
  end

  def find_broken_links
    resources.map(&:find_broken_links)
  end

  private

  def resources
    links.map { |link| Resource.new(@inspector, @url + link) }
  end

  def links
    @doc.css('*').map { |e| e['href'] || e['src'] }.compact
        .select { |e| %w[http https].include? e.scheme }
        .map { |e| Addressable::URI.parse(e.strip) }
  end
end
