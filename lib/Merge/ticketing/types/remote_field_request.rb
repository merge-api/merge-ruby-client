# frozen_string_literal: true

require_relative "remote_field_request_remote_field_class"
require "json"

module Merge
  module Ticketing
    class RemoteFieldRequest
      attr_reader :remote_field_class, :value, :additional_properties

      # @param remote_field_class [Ticketing::RemoteFieldRequestRemoteFieldClass]
      # @param value [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::RemoteFieldRequest]
      def initialize(remote_field_class:, value: nil, additional_properties: nil)
        # @type [Ticketing::RemoteFieldRequestRemoteFieldClass]
        @remote_field_class = remote_field_class
        # @type [String]
        @value = value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteFieldRequest
      #
      # @param json_object [JSON]
      # @return [Ticketing::RemoteFieldRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        remote_field_class = struct.remote_field_class.to_h.to_json
        remote_field_class = Ticketing::RemoteFieldRequestRemoteFieldClass.from_json(json_object: remote_field_class)
        value = struct.value
        new(remote_field_class: remote_field_class, value: value, additional_properties: struct)
      end

      # Serialize an instance of RemoteFieldRequest to a JSON object
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
        Ticketing::RemoteFieldRequestRemoteFieldClass.validate_raw(obj: obj.remote_field_class)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
