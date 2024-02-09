# frozen_string_literal: true

require_relative "url_type_enum"
require "json"

module Merge
  module Ats
    # # The Url Object
    #
    # ### Description
    #
    # The `Url` object is used to represent hyperlinks associated with the parent model.
    #
    # ### Usage Example
    #
    # Fetch from the `GET Candidate` endpoint and view their website urls.
    class UrlRequest
      attr_reader :value, :url_type, :integration_params, :linked_account_params, :additional_properties

      # @param value [String] The site's url.
      # @param url_type [URL_TYPE_ENUM] The type of site.
      #   - `PERSONAL` - PERSONAL
      #   - `COMPANY` - COMPANY
      #   - `PORTFOLIO` - PORTFOLIO
      #   - `BLOG` - BLOG
      #   - `SOCIAL_MEDIA` - SOCIAL_MEDIA
      #   - `OTHER` - OTHER
      #   - `JOB_POSTING` - JOB_POSTING
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::UrlRequest]
      def initialize(value: nil, url_type: nil, integration_params: nil, linked_account_params: nil,
                     additional_properties: nil)
        # @type [String] The site's url.
        @value = value
        # @type [URL_TYPE_ENUM] The type of site.
        #   - `PERSONAL` - PERSONAL
        #   - `COMPANY` - COMPANY
        #   - `PORTFOLIO` - PORTFOLIO
        #   - `BLOG` - BLOG
        #   - `SOCIAL_MEDIA` - SOCIAL_MEDIA
        #   - `OTHER` - OTHER
        #   - `JOB_POSTING` - JOB_POSTING
        @url_type = url_type
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of UrlRequest
      #
      # @param json_object [JSON]
      # @return [Ats::UrlRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = struct.value
        url_type = Ats::URL_TYPE_ENUM.key(parsed_json["url_type"]) || parsed_json["url_type"]
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(value: value, url_type: url_type, integration_params: integration_params,
            linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of UrlRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "value": @value,
          "url_type": Ats::URL_TYPE_ENUM[@url_type] || @url_type,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.url_type&.is_a?(Ats::URL_TYPE_ENUM) != false || raise("Passed value for field obj.url_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
