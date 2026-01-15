# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    class FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo
      # @return [String]
      attr_reader :method_
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

      # @param method_ [String]
      # @param url_path [String]
      # @param field_traversal_path [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      def initialize(method_: OMIT, url_path: OMIT, field_traversal_path: OMIT, additional_properties: nil)
        @method_ = method_ if method_ != OMIT
        @url_path = url_path if url_path != OMIT
        @field_traversal_path = field_traversal_path if field_traversal_path != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "method": method_,
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
      # @return [Merge::Crm::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method_ = parsed_json["method"]
        url_path = parsed_json["url_path"]
        field_traversal_path = parsed_json["field_traversal_path"]
        new(
          method_: method_,
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
        obj.method_&.is_a?(String) != false || raise("Passed value for field obj.method_ is not the expected type, validation failed.")
        obj.url_path&.is_a?(String) != false || raise("Passed value for field obj.url_path is not the expected type, validation failed.")
        obj.field_traversal_path&.is_a?(Array) != false || raise("Passed value for field obj.field_traversal_path is not the expected type, validation failed.")
      end
    end
  end
end
