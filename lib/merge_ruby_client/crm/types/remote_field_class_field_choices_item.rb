# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    class RemoteFieldClassFieldChoicesItem
      # @return [Object]
      attr_reader :value
      # @return [String]
      attr_reader :display_name
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param value [Object]
      # @param display_name [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::RemoteFieldClassFieldChoicesItem]
      def initialize(value: OMIT, display_name: OMIT, additional_properties: nil)
        @value = value if value != OMIT
        @display_name = display_name if display_name != OMIT
        @additional_properties = additional_properties
        @_field_set = { "value": value, "display_name": display_name }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldClassFieldChoicesItem
      #
      # @param json_object [String]
      # @return [Merge::Crm::RemoteFieldClassFieldChoicesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = parsed_json["value"]
        display_name = parsed_json["display_name"]
        new(
          value: value,
          display_name: display_name,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldClassFieldChoicesItem to a JSON object
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
        obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      end
    end
  end
end
