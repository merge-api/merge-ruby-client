# frozen_string_literal: true

require_relative "field_mapping_api_instance_remote_field_remote_endpoint_info"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class FieldMappingApiInstanceRemoteField
      # @return [String]
      attr_reader :remote_key_name
      # @return [Hash{String => Object}]
      attr_reader :schema
      # @return [Merge::Ticketing::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      attr_reader :remote_endpoint_info
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_key_name [String]
      # @param schema [Hash{String => Object}]
      # @param remote_endpoint_info [Merge::Ticketing::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::FieldMappingApiInstanceRemoteField]
      def initialize(remote_endpoint_info:, remote_key_name: OMIT, schema: OMIT, additional_properties: nil)
        @remote_key_name = remote_key_name if remote_key_name != OMIT
        @schema = schema if schema != OMIT
        @remote_endpoint_info = remote_endpoint_info
        @additional_properties = additional_properties
        @_field_set = {
          "remote_key_name": remote_key_name,
          "schema": schema,
          "remote_endpoint_info": remote_endpoint_info
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FieldMappingApiInstanceRemoteField
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::FieldMappingApiInstanceRemoteField]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_key_name = parsed_json["remote_key_name"]
        schema = parsed_json["schema"]
        if parsed_json["remote_endpoint_info"].nil?
          remote_endpoint_info = nil
        else
          remote_endpoint_info = parsed_json["remote_endpoint_info"].to_json
          remote_endpoint_info = Merge::Ticketing::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo.from_json(json_object: remote_endpoint_info)
        end
        new(
          remote_key_name: remote_key_name,
          schema: schema,
          remote_endpoint_info: remote_endpoint_info,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldMappingApiInstanceRemoteField to a JSON object
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
        obj.remote_key_name&.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.schema&.is_a?(Hash) != false || raise("Passed value for field obj.schema is not the expected type, validation failed.")
        Merge::Ticketing::FieldMappingApiInstanceRemoteFieldRemoteEndpointInfo.validate_raw(obj: obj.remote_endpoint_info)
      end
    end
  end
end
