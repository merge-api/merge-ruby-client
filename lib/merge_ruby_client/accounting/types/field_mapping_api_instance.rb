# frozen_string_literal: true

require_relative "field_mapping_api_instance_target_field"
require_relative "field_mapping_api_instance_remote_field"
require "ostruct"
require "json"

module Merge
  module Accounting
    class FieldMappingApiInstance
      # @return [String]
      attr_reader :id
      # @return [Boolean]
      attr_reader :is_integration_wide
      # @return [Merge::Accounting::FieldMappingApiInstanceTargetField]
      attr_reader :target_field
      # @return [Merge::Accounting::FieldMappingApiInstanceRemoteField]
      attr_reader :remote_field
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param is_integration_wide [Boolean]
      # @param target_field [Merge::Accounting::FieldMappingApiInstanceTargetField]
      # @param remote_field [Merge::Accounting::FieldMappingApiInstanceRemoteField]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::FieldMappingApiInstance]
      def initialize(id: OMIT, is_integration_wide: OMIT, target_field: OMIT, remote_field: OMIT,
                     additional_properties: nil)
        @id = id if id != OMIT
        @is_integration_wide = is_integration_wide if is_integration_wide != OMIT
        @target_field = target_field if target_field != OMIT
        @remote_field = remote_field if remote_field != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "is_integration_wide": is_integration_wide,
          "target_field": target_field,
          "remote_field": remote_field
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FieldMappingApiInstance
      #
      # @param json_object [String]
      # @return [Merge::Accounting::FieldMappingApiInstance]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        is_integration_wide = parsed_json["is_integration_wide"]
        if parsed_json["target_field"].nil?
          target_field = nil
        else
          target_field = parsed_json["target_field"].to_json
          target_field = Merge::Accounting::FieldMappingApiInstanceTargetField.from_json(json_object: target_field)
        end
        if parsed_json["remote_field"].nil?
          remote_field = nil
        else
          remote_field = parsed_json["remote_field"].to_json
          remote_field = Merge::Accounting::FieldMappingApiInstanceRemoteField.from_json(json_object: remote_field)
        end
        new(
          id: id,
          is_integration_wide: is_integration_wide,
          target_field: target_field,
          remote_field: remote_field,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldMappingApiInstance to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.is_integration_wide&.is_a?(Boolean) != false || raise("Passed value for field obj.is_integration_wide is not the expected type, validation failed.")
        obj.target_field.nil? || Merge::Accounting::FieldMappingApiInstanceTargetField.validate_raw(obj: obj.target_field)
        obj.remote_field.nil? || Merge::Accounting::FieldMappingApiInstanceRemoteField.validate_raw(obj: obj.remote_field)
      end
    end
  end
end
