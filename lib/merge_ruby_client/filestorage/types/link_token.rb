# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class LinkToken
      # @return [String]
      attr_reader :link_token
      # @return [String]
      attr_reader :integration_name
      # @return [String]
      attr_reader :magic_link_url
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param link_token [String]
      # @param integration_name [String]
      # @param magic_link_url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::LinkToken]
      def initialize(link_token:, integration_name: OMIT, magic_link_url: OMIT, additional_properties: nil)
        @link_token = link_token
        @integration_name = integration_name if integration_name != OMIT
        @magic_link_url = magic_link_url if magic_link_url != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "link_token": link_token,
          "integration_name": integration_name,
          "magic_link_url": magic_link_url
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of LinkToken
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::LinkToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        link_token = struct["link_token"]
        integration_name = struct["integration_name"]
        magic_link_url = struct["magic_link_url"]
        new(
          link_token: link_token,
          integration_name: integration_name,
          magic_link_url: magic_link_url,
          additional_properties: struct
        )
      end

      # Serialize an instance of LinkToken to a JSON object
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
        obj.link_token.is_a?(String) != false || raise("Passed value for field obj.link_token is not the expected type, validation failed.")
        obj.integration_name&.is_a?(String) != false || raise("Passed value for field obj.integration_name is not the expected type, validation failed.")
        obj.magic_link_url&.is_a?(String) != false || raise("Passed value for field obj.magic_link_url is not the expected type, validation failed.")
      end
    end
  end
end
