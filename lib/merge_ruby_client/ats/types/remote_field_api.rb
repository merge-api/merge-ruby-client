# frozen_string_literal: true

require_relative "remote_endpoint_info"
require_relative "advanced_metadata"
require "ostruct"
require "json"

module Merge
  module Ats
    class RemoteFieldApi
      # @return [Hash{String => Object}]
      attr_reader :schema
      # @return [String]
      attr_reader :remote_key_name
      # @return [Merge::Ats::RemoteEndpointInfo]
      attr_reader :remote_endpoint_info
      # @return [Array<Object>]
      attr_reader :example_values
      # @return [Merge::Ats::AdvancedMetadata]
      attr_reader :advanced_metadata
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param schema [Hash{String => Object}]
      # @param remote_key_name [String]
      # @param remote_endpoint_info [Merge::Ats::RemoteEndpointInfo]
      # @param example_values [Array<Object>]
      # @param advanced_metadata [Merge::Ats::AdvancedMetadata]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::RemoteFieldApi]
      def initialize(schema:, remote_key_name:, remote_endpoint_info:, example_values:, advanced_metadata: OMIT,
                     additional_properties: nil)
        @schema = schema
        @remote_key_name = remote_key_name
        @remote_endpoint_info = remote_endpoint_info
        @example_values = example_values
        @advanced_metadata = advanced_metadata if advanced_metadata != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "schema": schema,
          "remote_key_name": remote_key_name,
          "remote_endpoint_info": remote_endpoint_info,
          "example_values": example_values,
          "advanced_metadata": advanced_metadata
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldApi
      #
      # @param json_object [String]
      # @return [Merge::Ats::RemoteFieldApi]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        schema = struct["schema"]
        remote_key_name = struct["remote_key_name"]
        if parsed_json["remote_endpoint_info"].nil?
          remote_endpoint_info = nil
        else
          remote_endpoint_info = parsed_json["remote_endpoint_info"].to_json
          remote_endpoint_info = Merge::Ats::RemoteEndpointInfo.from_json(json_object: remote_endpoint_info)
        end
        example_values = struct["example_values"]
        if parsed_json["advanced_metadata"].nil?
          advanced_metadata = nil
        else
          advanced_metadata = parsed_json["advanced_metadata"].to_json
          advanced_metadata = Merge::Ats::AdvancedMetadata.from_json(json_object: advanced_metadata)
        end
        new(
          schema: schema,
          remote_key_name: remote_key_name,
          remote_endpoint_info: remote_endpoint_info,
          example_values: example_values,
          advanced_metadata: advanced_metadata,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldApi to a JSON object
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
        obj.schema.is_a?(Hash) != false || raise("Passed value for field obj.schema is not the expected type, validation failed.")
        obj.remote_key_name.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        Merge::Ats::RemoteEndpointInfo.validate_raw(obj: obj.remote_endpoint_info)
        obj.example_values.is_a?(Array) != false || raise("Passed value for field obj.example_values is not the expected type, validation failed.")
        obj.advanced_metadata.nil? || Merge::Ats::AdvancedMetadata.validate_raw(obj: obj.advanced_metadata)
      end
    end
  end
end
