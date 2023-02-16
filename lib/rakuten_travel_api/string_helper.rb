# frozen_string_literal: true

module RakutenTravelApi
  module StringHelper
    refine String do
      def to_snake
        gsub(/([a-z]+)([A-Z]{1})/, '\1_\2').downcase
      end

      def to_camel
        gsub(/([a-z]{1})_([a-z]{1})/) do |matched|
          matched = matched.split("_")
          matched[0] + matched[1].capitalize
        end
      end

      def capitalize_from_snake
        split("_").map(&:capitalize).join
      end

      def to_const
        Object.const_get(self)
      end
    end
  end
end
