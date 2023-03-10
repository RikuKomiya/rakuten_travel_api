# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

module RakutenTravelApi
  class Request
    attr_reader :params, :url, :path

    def initialize(path:, params:)
      @url = URI.parse("https://app.rakuten.co.jp/")
      @path = path
      @params = params
    end

    def send_request
      res = create_request
      code = res.code.to_i

      RakutenTravelApi::Errors.raise_response_error(code, res.body) unless code == 200

      RakutenTravelApi::Response.new(JSON.parse(res.body))
    end

    private

    def create_request
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      http.get "#{path}?#{URI.encode_www_form(params)}"
    end
  end
end
