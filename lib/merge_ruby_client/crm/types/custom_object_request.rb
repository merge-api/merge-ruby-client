# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    class CustomObjectRequest
      # @return [Hash{String => Object}]
      attr_reader :fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param fields [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::CustomObjectRequest]
      def initialize(fields:, additional_properties: nil)
        @fields = fields
        @additional_properties = additional_properties
        @_field_set = { "fields": fields }
      end

      # Deserialize a JSON object to an instance of CustomObjectRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::CustomObjectRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        fields = parsed_json["fields"]
        new(fields: fields, additional_properties: struct)
      end

      # Serialize an instance of CustomObjectRequest to a JSON object
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
        obj.fields.is_a?(Hash) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
      end
    end
  end
end
