# frozen_string_literal: true

require_relative "individual_common_model_scope_deserializer"
require "ostruct"
require "json"

module Merge
  module Filestorage
    class CommonModelScopeApi
      # @return [Array<Merge::Filestorage::IndividualCommonModelScopeDeserializer>] The common models you want to update the scopes for
      attr_reader :common_models
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param common_models [Array<Merge::Filestorage::IndividualCommonModelScopeDeserializer>] The common models you want to update the scopes for
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::CommonModelScopeApi]
      def initialize(common_models:, additional_properties: nil)
        @common_models = common_models
        @additional_properties = additional_properties
        @_field_set = { "common_models": common_models }
      end

      # Deserialize a JSON object to an instance of CommonModelScopeApi
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::CommonModelScopeApi]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        common_models = parsed_json["common_models"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::IndividualCommonModelScopeDeserializer.from_json(json_object: v)
        end
        new(common_models: common_models, additional_properties: struct)
      end

      # Serialize an instance of CommonModelScopeApi to a JSON object
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
        obj.common_models.is_a?(Array) != false || raise("Passed value for field obj.common_models is not the expected type, validation failed.")
      end
    end
  end
end
