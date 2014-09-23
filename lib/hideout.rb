require "hideout/version"
require 'hideout/client'

require 'logger'
require 'open-uri'
require 'json'
require 'base64'

module Hideout

  def self.get(*args)
    client.get(*args)
  end

  def self.decode(data)
    Base64.urlsafe_decode64(data)
  end

  def self.encode(url)
    Base64.urlsafe_encode64(url)
  end

  def self.client
    @client ||= Hideout::Client.new(
      ENV['HIDEOUT_URL'], ENV['HIDEOUT_TOKEN'])
  end

end
