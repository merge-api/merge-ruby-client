# frozen_string_literal: true

require "json"

module Merge
  module Hris
    class DebugModelLogSummary
      attr_reader :url, :method, :status_code, :additional_properties

      # @param url [String]
      # @param method [String]
      # @param status_code [Integer]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::DebugModelLogSummary]
      def initialize(url:, method:, status_code:, additional_properties: nil)
        # @type [String]
        @url = url
        # @type [String]
        @method = method
        # @type [Integer]
        @status_code = status_code
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of DebugModelLogSummary
      #
      # @param json_object [JSON]
      # @return [Hris::DebugModelLogSummary]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        url = struct.url
        method = struct.method
        status_code = struct.status_code
        new(url: url, method: method, status_code: status_code, additional_properties: struct)
      end

      # Serialize an instance of DebugModelLogSummary to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "url": @url, "method": @method, "status_code": @status_code }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
