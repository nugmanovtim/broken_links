class HttpRequest
  def initialize(url)
    @url = url
  end

  # return HttpResponse
  def go
    HttpResponse.new(
      RestClient::Request.execute(method: :get, url: @url.to_s)
    )
  rescue RestClient::NotFound, RestClient::Exceptions::OpenTimeout,
         RestClient::InternalServerError, RestClient::SSLCertificateNotVerified,
         Errno::ECONNRESET, SocketError, RestClient::ServiceUnavailable,
         RestClient::ServerBrokeConnection
    HttpResponse::ERROR
  rescue URI::InvalidURIError
    HttpResponse::ERROR
  end
end
