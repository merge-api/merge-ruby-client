# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    # # The RemoteKey Object
    #  ### Description
    #  The `RemoteKey` object is used to represent a request for a new remote key.
    #  ### Usage Example
    #  Post a `GenerateRemoteKey` to receive a new `RemoteKey`.
    class RemoteKey
      # @return [String]
      attr_reader :name
      # @return [String]
      attr_reader :key
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String]
      # @param key [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::RemoteKey]
      def initialize(name:, key:, additional_properties: nil)
        @name = name
        @key = key
        @additional_properties = additional_properties
        @_field_set = { "name": name, "key": key }
      end

      # Deserialize a JSON object to an instance of RemoteKey
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::RemoteKey]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct["name"]
        key = struct["key"]
        new(
          name: name,
          key: key,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteKey to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      end
    end
  end
end
