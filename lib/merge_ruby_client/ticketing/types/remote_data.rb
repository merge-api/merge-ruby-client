# frozen_string_literal: true

require "json"

module Merge
  module Ticketing
    class RemoteData
      attr_reader :path, :data, :additional_properties

      # @param path [String]
      # @param data [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::RemoteData]
      def initialize(path:, data: nil, additional_properties: nil)
        # @type [String]
        @path = path
        # @type [Object]
        @data = data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteData
      #
      # @param json_object [JSON]
      # @return [Ticketing::RemoteData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        path = struct.path
        data = struct.data
        new(path: path, data: data, additional_properties: struct)
      end

      # Serialize an instance of RemoteData to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "path": @path, "data": @data }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
