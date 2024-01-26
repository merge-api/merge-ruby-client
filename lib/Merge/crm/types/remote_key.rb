# frozen_string_literal: true
require "json"

module Merge
  module Crm
    # # The RemoteKey Object 
### Description

The `RemoteKey` object is used to represent a request for a new remote key.

### Usage Example

Post a `GenerateRemoteKey` to receive a new `RemoteKey`.
    class RemoteKey
      attr_reader :name, :key, :additional_properties
      # @param name [String] 
      # @param key [String] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::RemoteKey]
      def initialize(name:, key:, additional_properties: nil)
        # @type [String] 
        @name = name
        # @type [String] 
        @key = key
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of RemoteKey
      #
      # @param json_object [JSON] 
      # @return [Crm::RemoteKey]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        key = struct.key
        new(name: name, key: key, additional_properties: struct)
      end
      # Serialize an instance of RemoteKey to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "key": @key }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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