# frozen_string_literal: true

require_relative "field_permission_deserializer_request"
require "ostruct"
require "json"

module Merge
  module Ats
    class IndividualCommonModelScopeDeserializerRequest
      # @return [String]
      attr_reader :model_name
      # @return [Hash{String => Merge::Ats::ModelPermissionDeserializerRequest}]
      attr_reader :model_permissions
      # @return [Merge::Ats::FieldPermissionDeserializerRequest]
      attr_reader :field_permissions
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model_name [String]
      # @param model_permissions [Hash{String => Merge::Ats::ModelPermissionDeserializerRequest}]
      # @param field_permissions [Merge::Ats::FieldPermissionDeserializerRequest]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::IndividualCommonModelScopeDeserializerRequest]
      def initialize(model_name:, model_permissions: OMIT, field_permissions: OMIT, additional_properties: nil)
        @model_name = model_name
        @model_permissions = model_permissions if model_permissions != OMIT
        @field_permissions = field_permissions if field_permissions != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "model_name": model_name,
          "model_permissions": model_permissions,
          "field_permissions": field_permissions
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  IndividualCommonModelScopeDeserializerRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::IndividualCommonModelScopeDeserializerRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        model_name = struct["model_name"]
        model_permissions = parsed_json["model_permissions"]&.transform_values do |v|
          v = v.to_json
          Merge::Ats::ModelPermissionDeserializerRequest.from_json(json_object: v)
        end
        if parsed_json["field_permissions"].nil?
          field_permissions = nil
        else
          field_permissions = parsed_json["field_permissions"].to_json
          field_permissions = Merge::Ats::FieldPermissionDeserializerRequest.from_json(json_object: field_permissions)
        end
        new(
          model_name: model_name,
          model_permissions: model_permissions,
          field_permissions: field_permissions,
          additional_properties: struct
        )
      end

      # Serialize an instance of IndividualCommonModelScopeDeserializerRequest to a JSON
      #  object
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
        obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
        obj.model_permissions&.is_a?(Hash) != false || raise("Passed value for field obj.model_permissions is not the expected type, validation failed.")
        obj.field_permissions.nil? || Merge::Ats::FieldPermissionDeserializerRequest.validate_raw(obj: obj.field_permissions)
      end
    end
  end
end
