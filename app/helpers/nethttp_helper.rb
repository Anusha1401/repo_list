module NethttpHelper
  require 'net/http'
  # require 'json'
  HTTP_PROXY = URI.parse(ENV['http_proxy'] || "")

  def generate_http_request(http_url)
    new_http = Net::HTTP.new(http_url.host, http_url.port, HTTP_PROXY.host, HTTP_PROXY.port)
    new_http.use_ssl = http_url.scheme == "https"
    return new_http
  end

  def generate_get_request(get_url, get_params={})
    new_request = Net::HTTP::Get.new(self.path_with_query_string(get_url), get_params)
    return new_request
  end

  def path_with_query_string(uri)
    path = uri.path
    path += "?#{uri.query}" if uri.query
    path
  end
end