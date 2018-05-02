class HttpRequest
  def initialize(url)
    @url = url
  end

  # return HttpResponse
  def go
    HttpResponse.new(
      RestClient::Request.execute(method: :get, url: @url)
    )
  end
end
