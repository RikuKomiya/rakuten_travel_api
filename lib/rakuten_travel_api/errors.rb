# frozen_string_literal: true

module RakutenTravelApi
  class Errors
    class ApplicationIdMissingError < StandardError; end

    class ResponseError < StandardError
      attr_accessor :code, :message

      def initialize(code, message)
        @code = Integer(code)
        @message = message
      end
    end

    class WrongParameterError < ResponseError; end

    class NotFoundError < ResponseError; end

    class TooManyRequestError < ResponseError; end

    class SystemError < ResponseError; end

    class ServiceUnavailableError < ResponseError; end

    class NotDefinedError < ResponseError; end

    def self.raise_response_error(code, res_body)
      klass = case code
              when 400
                WrongParameterError
              when 404
                NotFoundError
              when 429
                TooManyRequestError
              when 500
                SystemError
              when 503
                ServiceUnavailableError
              else
                NotDefinedError
              end

      raise klass.new(code, res_body)
    end
  end
end
