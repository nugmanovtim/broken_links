class BrokenLinksInspector
  def initialize(starting_url)
    @starting_url = URI(starting_url)
    @visited_urls = Set.new
  end

  def go
    Resource.new(self, @starting_url).find_broken_links.flatten.compact
  end

  def mark_as_visited(url)
    puts url
    @visited_urls << url
  end

  def visited?(url)
    @visited_urls.include? url
  end

  def correct_host?(host)
    @starting_url.host == host
  end
end
