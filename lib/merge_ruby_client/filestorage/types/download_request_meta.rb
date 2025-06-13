# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class DownloadRequestMeta
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :url
      # @return [String]
      attr_reader :method
      # @return [Hash{String => Object}]
      attr_reader :headers
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param url [String]
      # @param method [String]
      # @param headers [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::DownloadRequestMeta]
      def initialize(id:, url:, method:, headers:, additional_properties: nil)
        @id = id
        @url = url
        @method = method
        @headers = headers
        @additional_properties = additional_properties
        @_field_set = { "id": id, "url": url, "method": method, "headers": headers }
      end

      # Deserialize a JSON object to an instance of DownloadRequestMeta
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::DownloadRequestMeta]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        url = parsed_json["url"]
        method = parsed_json["method"]
        headers = parsed_json["headers"]
        new(
          id: id,
          url: url,
          method: method,
          headers: headers,
          additional_properties: struct
        )
      end

      # Serialize an instance of DownloadRequestMeta to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.headers.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      end
    end
  end
end
