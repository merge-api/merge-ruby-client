# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ats
    class FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo
      # @return [String]
      attr_reader :method
      # @return [String]
      attr_reader :url_path
      # @return [Array<String>]
      attr_reader :field_traversal_path
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param method [String]
      # @param url_path [String]
      # @param field_traversal_path [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      def initialize(method: OMIT, url_path: OMIT, field_traversal_path: OMIT, additional_properties: nil)
        @method = method if method != OMIT
        @url_path = url_path if url_path != OMIT
        @field_traversal_path = field_traversal_path if field_traversal_path != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "method": method,
          "url_path": url_path,
          "field_traversal_path": field_traversal_path
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo
      #
      # @param json_object [String]
      # @return [Merge::Ats::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        method = struct["method"]
        url_path = struct["url_path"]
        field_traversal_path = struct["field_traversal_path"]
        new(
          method: method,
          url_path: url_path,
          field_traversal_path: field_traversal_path,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo to
      #  a JSON object
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
        obj.method&.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.url_path&.is_a?(String) != false || raise("Passed value for field obj.url_path is not the expected type, validation failed.")
        obj.field_traversal_path&.is_a?(Array) != false || raise("Passed value for field obj.field_traversal_path is not the expected type, validation failed.")
      end
    end
  end
end
