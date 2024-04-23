# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    # # The ModelOperation Object
    #  ### Description
    #  The `ModelOperation` object is used to represent the operations that are
    #  currently supported for a given model.
    #  ### Usage Example
    #  View what operations are supported for the `Candidate` endpoint.
    class ModelOperation
      # @return [String]
      attr_reader :model_name
      # @return [Array<String>]
      attr_reader :available_operations
      # @return [Array<String>]
      attr_reader :required_post_parameters
      # @return [Array<String>]
      attr_reader :supported_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model_name [String]
      # @param available_operations [Array<String>]
      # @param required_post_parameters [Array<String>]
      # @param supported_fields [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::ModelOperation]
      def initialize(model_name:, available_operations:, required_post_parameters:, supported_fields:,
                     additional_properties: nil)
        @model_name = model_name
        @available_operations = available_operations
        @required_post_parameters = required_post_parameters
        @supported_fields = supported_fields
        @additional_properties = additional_properties
        @_field_set = {
          "model_name": model_name,
          "available_operations": available_operations,
          "required_post_parameters": required_post_parameters,
          "supported_fields": supported_fields
        }
      end

      # Deserialize a JSON object to an instance of ModelOperation
      #
      # @param json_object [String]
      # @return [Merge::Crm::ModelOperation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        model_name = struct["model_name"]
        available_operations = struct["available_operations"]
        required_post_parameters = struct["required_post_parameters"]
        supported_fields = struct["supported_fields"]
        new(
          model_name: model_name,
          available_operations: available_operations,
          required_post_parameters: required_post_parameters,
          supported_fields: supported_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of ModelOperation to a JSON object
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
        obj.available_operations.is_a?(Array) != false || raise("Passed value for field obj.available_operations is not the expected type, validation failed.")
        obj.required_post_parameters.is_a?(Array) != false || raise("Passed value for field obj.required_post_parameters is not the expected type, validation failed.")
        obj.supported_fields.is_a?(Array) != false || raise("Passed value for field obj.supported_fields is not the expected type, validation failed.")
      end
    end
  end
end
