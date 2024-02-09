# frozen_string_literal: true

require "json"

module Merge
  module Crm
    class RemoteFieldClassFieldChoicesItem
      attr_reader :value, :display_name, :additional_properties

      # @param value [Object]
      # @param display_name [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::RemoteFieldClassFieldChoicesItem]
      def initialize(value: nil, display_name: nil, additional_properties: nil)
        # @type [Object]
        @value = value
        # @type [String]
        @display_name = display_name
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteFieldClassFieldChoicesItem
      #
      # @param json_object [JSON]
      # @return [Crm::RemoteFieldClassFieldChoicesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        value = struct.value
        display_name = struct.display_name
        new(value: value, display_name: display_name, additional_properties: struct)
      end

      # Serialize an instance of RemoteFieldClassFieldChoicesItem to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "value": @value, "display_name": @display_name }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      end
    end
  end
end
