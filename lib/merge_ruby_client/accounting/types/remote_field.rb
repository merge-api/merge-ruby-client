# frozen_string_literal: true

require_relative "remote_field_remote_field_class"
require "ostruct"
require "json"

module Merge
  module Accounting
    class RemoteField
      # @return [Merge::Accounting::RemoteFieldRemoteFieldClass]
      attr_reader :remote_field_class
      # @return [Object]
      attr_reader :value
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_field_class [Merge::Accounting::RemoteFieldRemoteFieldClass]
      # @param value [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::RemoteField]
      def initialize(remote_field_class:, value: OMIT, additional_properties: nil)
        @remote_field_class = remote_field_class
        @value = value if value != OMIT
        @additional_properties = additional_properties
        @_field_set = { "remote_field_class": remote_field_class, "value": value }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteField
      #
      # @param json_object [String]
      # @return [Merge::Accounting::RemoteField]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["remote_field_class"].nil?
          remote_field_class = nil
        else
          remote_field_class = parsed_json["remote_field_class"].to_json
          remote_field_class = Merge::Accounting::RemoteFieldRemoteFieldClass.from_json(json_object: remote_field_class)
        end
        value = parsed_json["value"]
        new(
          remote_field_class: remote_field_class,
          value: value,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteField to a JSON object
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
        Merge::Accounting::RemoteFieldRemoteFieldClass.validate_raw(obj: obj.remote_field_class)
        obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
