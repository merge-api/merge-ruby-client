# frozen_string_literal: true

require "json"

module Merge
  module Accounting
    class LinkToken
      attr_reader :link_token, :integration_name, :magic_link_url, :additional_properties

      # @param link_token [String]
      # @param integration_name [String]
      # @param magic_link_url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::LinkToken]
      def initialize(link_token:, integration_name: nil, magic_link_url: nil, additional_properties: nil)
        # @type [String]
        @link_token = link_token
        # @type [String]
        @integration_name = integration_name
        # @type [String]
        @magic_link_url = magic_link_url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LinkToken
      #
      # @param json_object [JSON]
      # @return [Accounting::LinkToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        link_token = struct.link_token
        integration_name = struct.integration_name
        magic_link_url = struct.magic_link_url
        new(link_token: link_token, integration_name: integration_name, magic_link_url: magic_link_url,
            additional_properties: struct)
      end

      # Serialize an instance of LinkToken to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "link_token": @link_token, "integration_name": @integration_name, "magic_link_url": @magic_link_url }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.link_token.is_a?(String) != false || raise("Passed value for field obj.link_token is not the expected type, validation failed.")
        obj.integration_name&.is_a?(String) != false || raise("Passed value for field obj.integration_name is not the expected type, validation failed.")
        obj.magic_link_url&.is_a?(String) != false || raise("Passed value for field obj.magic_link_url is not the expected type, validation failed.")
      end
    end
  end
end
