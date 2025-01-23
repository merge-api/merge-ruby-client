# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    class AsyncPostTaskResult
      # @return [Integer]
      attr_reader :status_code
      # @return [Hash{String => Object}]
      attr_reader :response
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param status_code [Integer]
      # @param response [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AsyncPostTaskResult]
      def initialize(status_code: OMIT, response: OMIT, additional_properties: nil)
        @status_code = status_code if status_code != OMIT
        @response = response if response != OMIT
        @additional_properties = additional_properties
        @_field_set = { "status_code": status_code, "response": response }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AsyncPostTaskResult
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AsyncPostTaskResult]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        status_code = parsed_json["status_code"]
        response = parsed_json["response"]
        new(
          status_code: status_code,
          response: response,
          additional_properties: struct
        )
      end

      # Serialize an instance of AsyncPostTaskResult to a JSON object
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
        obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
        obj.response&.is_a?(Hash) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
      end
    end
  end
end
