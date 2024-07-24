# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    class RemoteEndpointInfo
      # @return [String]
      attr_reader :method
      # @return [String]
      attr_reader :url_path
      # @return [Array<Object>]
      attr_reader :field_traversal_path
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param method [String]
      # @param url_path [String]
      # @param field_traversal_path [Array<Object>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::RemoteEndpointInfo]
      def initialize(method:, url_path:, field_traversal_path:, additional_properties: nil)
        @method = method
        @url_path = url_path
        @field_traversal_path = field_traversal_path
        @additional_properties = additional_properties
        @_field_set = { "method": method, "url_path": url_path, "field_traversal_path": field_traversal_path }
      end

      # Deserialize a JSON object to an instance of RemoteEndpointInfo
      #
      # @param json_object [String]
      # @return [Merge::Accounting::RemoteEndpointInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method = parsed_json["method"]
        url_path = parsed_json["url_path"]
        field_traversal_path = parsed_json["field_traversal_path"]
        new(
          method: method,
          url_path: url_path,
          field_traversal_path: field_traversal_path,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteEndpointInfo to a JSON object
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
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.url_path.is_a?(String) != false || raise("Passed value for field obj.url_path is not the expected type, validation failed.")
        obj.field_traversal_path.is_a?(Array) != false || raise("Passed value for field obj.field_traversal_path is not the expected type, validation failed.")
      end
    end
  end
end
