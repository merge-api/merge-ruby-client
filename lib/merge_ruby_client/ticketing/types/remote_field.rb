# frozen_string_literal: true

require_relative "remote_field_remote_field_class"
require "json"

module Merge
  module Ticketing
    class RemoteField
      attr_reader :remote_field_class, :value, :additional_properties

      # @param remote_field_class [Ticketing::RemoteFieldRemoteFieldClass]
      # @param value [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::RemoteField]
      def initialize(remote_field_class:, value: nil, additional_properties: nil)
        # @type [Ticketing::RemoteFieldRemoteFieldClass]
        @remote_field_class = remote_field_class
        # @type [Object]
        @value = value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteField
      #
      # @param json_object [JSON]
      # @return [Ticketing::RemoteField]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["remote_field_class"].nil?
          remote_field_class = nil
        else
          remote_field_class = parsed_json["remote_field_class"].to_json
          remote_field_class = Ticketing::RemoteFieldRemoteFieldClass.from_json(json_object: remote_field_class)
        end
        value = struct.value
        new(remote_field_class: remote_field_class, value: value, additional_properties: struct)
      end

      # Serialize an instance of RemoteField to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "remote_field_class": @remote_field_class, "value": @value }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Ticketing::RemoteFieldRemoteFieldClass.validate_raw(obj: obj.remote_field_class)
        obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
