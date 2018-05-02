class HttpResponse
  def initialize(rest_client_response)
    @rest_client_response = rest_client_response
  end

  # look up in headers
  def html?
    @rest_client_response.headers[:content_type].split(';')
                         .map { |header| header.downcase.strip }
                         .include?('text/html')
  end

  def method_missing(method, *args)
    return @rest_client_response.send(method, *args) if respond_to? method
    super
  end

  def respond_to_missing?(method, *)
    return true if @rest_client_response.respond_to? method
    super
  end
end
