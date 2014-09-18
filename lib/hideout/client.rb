module Hideout
  class Client

  attr_accessor :base_uri, :access_token

  def initialize(base_uri, access_token)
    raise ArgumentError, 'Missing base_uri/access_token for hideout gem' unless
      base_uri && access_token
    self.base_uri = base_uri
    self.access_token = access_token
  end

  def logger
    @logger ||= Logger.new($stdout).tap do |x|
      x.progname = 'hideout'
    end
  end

  def get(target_url, raise_error = true)

    data = Base64.urlsafe_encode64(target_url)

    uri = URI(base_uri)
    uri.path = '/api/offers'
    uri.query = "url=#{data}"
    endpoint = uri.to_s

    logger.debug "GET: #{endpoint}"
    res = open(endpoint, 'X_API_KEY' => access_token)
    data = JSON.parse(res.read)
    logger.debug "DATA: #{data.inspect}"
    if data['success'] == true
      data
    end
  rescue OpenURI::HTTPError => e
    raise e if raise_error
  end

  end
end
