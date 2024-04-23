# frozen_string_literal: true

require_relative "remote_field_request_remote_field_class"
require "ostruct"
require "json"

module Merge
  module Crm
    class RemoteFieldRequest
      # @return [Merge::Crm::RemoteFieldRequestRemoteFieldClass]
      attr_reader :remote_field_class
      # @return [String]
      attr_reader :value
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_field_class [Merge::Crm::RemoteFieldRequestRemoteFieldClass]
      # @param value [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::RemoteFieldRequest]
      def initialize(remote_field_class:, value: OMIT, additional_properties: nil)
        @remote_field_class = remote_field_class
        @value = value if value != OMIT
        @additional_properties = additional_properties
        @_field_set = { "remote_field_class": remote_field_class, "value": value }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::RemoteFieldRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["remote_field_class"].nil?
          remote_field_class = nil
        else
          remote_field_class = parsed_json["remote_field_class"].to_json
          remote_field_class = Merge::Crm::RemoteFieldRequestRemoteFieldClass.from_json(json_object: remote_field_class)
        end
        value = struct["value"]
        new(
          remote_field_class: remote_field_class,
          value: value,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldRequest to a JSON object
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
        Merge::Crm::RemoteFieldRequestRemoteFieldClass.validate_raw(obj: obj.remote_field_class)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
