# frozen_string_literal: true

require "json"

module Merge
  module Crm
    class CustomObjectRequest
      attr_reader :fields, :additional_properties

      # @param fields [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::CustomObjectRequest]
      def initialize(fields:, additional_properties: nil)
        # @type [Hash{String => String}]
        @fields = fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CustomObjectRequest
      #
      # @param json_object [JSON]
      # @return [Crm::CustomObjectRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        fields = struct.fields
        new(fields: fields, additional_properties: struct)
      end

      # Serialize an instance of CustomObjectRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "fields": @fields }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.fields.is_a?(Hash) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
      end
    end
  end
end
