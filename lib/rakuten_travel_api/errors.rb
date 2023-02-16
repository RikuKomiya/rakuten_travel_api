# frozen_string_literal: true

module RakutenTravelApi
  class Errors
    class BaseError < StandardError
      attr_accessor :code, :message

      def initialize(code, message)
        @code = Integer(code)
        @message = message
      end
    end

    class WrongParameterError < BaseError; end

    class NotFoundError < BaseError; end

    class TooManyRequestError < BaseError; end

    class SystemError < BaseError; end

    class ServiceUnavailableError < BaseError; end

    class NotDefinedError < BaseError; end

    def self.raise_error(code, res_body)
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
