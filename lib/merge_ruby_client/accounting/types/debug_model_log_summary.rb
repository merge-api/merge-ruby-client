# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    class DebugModelLogSummary
      # @return [String]
      attr_reader :url
      # @return [String]
      attr_reader :method
      # @return [Integer]
      attr_reader :status_code
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param url [String]
      # @param method [String]
      # @param status_code [Integer]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::DebugModelLogSummary]
      def initialize(url:, method:, status_code:, additional_properties: nil)
        @url = url
        @method = method
        @status_code = status_code
        @additional_properties = additional_properties
        @_field_set = { "url": url, "method": method, "status_code": status_code }
      end

      # Deserialize a JSON object to an instance of DebugModelLogSummary
      #
      # @param json_object [String]
      # @return [Merge::Accounting::DebugModelLogSummary]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        url = parsed_json["url"]
        method = parsed_json["method"]
        status_code = parsed_json["status_code"]
        new(
          url: url,
          method: method,
          status_code: status_code,
          additional_properties: struct
        )
      end

      # Serialize an instance of DebugModelLogSummary to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.status_code.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
      end
    end
  end
end
