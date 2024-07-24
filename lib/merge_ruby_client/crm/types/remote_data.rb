# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    class RemoteData
      # @return [String]
      attr_reader :path
      # @return [Object]
      attr_reader :data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param path [String]
      # @param data [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::RemoteData]
      def initialize(path:, data: OMIT, additional_properties: nil)
        @path = path
        @data = data if data != OMIT
        @additional_properties = additional_properties
        @_field_set = { "path": path, "data": data }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteData
      #
      # @param json_object [String]
      # @return [Merge::Crm::RemoteData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        path = parsed_json["path"]
        data = parsed_json["data"]
        new(
          path: path,
          data: data,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteData to a JSON object
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
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.data&.is_a?(Object) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      end
    end
  end
end
