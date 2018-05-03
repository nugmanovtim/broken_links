class HttpResponse
  def initialize(rest_client_response)
    @rest_client_response = rest_client_response
  end

  ERROR = HttpResponse.new(nil)

  def not_found?
    self == ERROR
  end

  # look up in headers
  def html?
    return false if not_found?
    @rest_client_response.headers[:content_type].split(';')
                         .map { |header| header.downcase.strip }
                         .include?('text/html')
  end

  def body
    return nil if not_found?
    @rest_client_response.body
  end
end
