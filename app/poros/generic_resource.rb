# Any web resource that isn't an HTML page
class GenericResource < Resource
  def find_broken_links
    broken? ? i_am_broken : i_am_not_broken
  end
end
