# Resource that is an HTML page
class HtmlPage < Resource
  def find_broken_links
    return i_am_broken if broken?
    resources.map(&:find_broken_links)
  end

  private

  # Parse HTML
  def resources
    []
  end
end
