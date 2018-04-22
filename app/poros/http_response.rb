class HttpResponse
  def initialize(rest_client_response)
    @rest_client_response = rest_client_response
  end

  # look up in headers
  def html?; end
end
