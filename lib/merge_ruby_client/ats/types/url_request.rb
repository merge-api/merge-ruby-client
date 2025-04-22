# frozen_string_literal: true

require_relative "url_type_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Url Object
    #  ### Description
    #  The `Url` object is used to represent hyperlinks associated with the parent
    #  model.
    #  ### Usage Example
    #  Fetch from the `GET Candidate` endpoint and view their website urls.
    class UrlRequest
      # @return [String] The site's url.
      attr_reader :value
      # @return [Merge::Ats::UrlTypeEnum] The type of site.
      #  * `PERSONAL` - PERSONAL
      #  * `COMPANY` - COMPANY
      #  * `PORTFOLIO` - PORTFOLIO
      #  * `BLOG` - BLOG
      #  * `SOCIAL_MEDIA` - SOCIAL_MEDIA
      #  * `OTHER` - OTHER
      #  * `JOB_POSTING` - JOB_POSTING
      attr_reader :url_type
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param value [String] The site's url.
      # @param url_type [Merge::Ats::UrlTypeEnum] The type of site.
      #  * `PERSONAL` - PERSONAL
      #  * `COMPANY` - COMPANY
      #  * `PORTFOLIO` - PORTFOLIO
      #  * `BLOG` - BLOG
      #  * `SOCIAL_MEDIA` - SOCIAL_MEDIA
      #  * `OTHER` - OTHER
      #  * `JOB_POSTING` - JOB_POSTING
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::UrlRequest]
      def initialize(value: OMIT, url_type: OMIT, integration_params: OMIT, linked_account_params: OMIT,
                     additional_properties: nil)
        @value = value if value != OMIT
        @url_type = url_type if url_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "value": value,
          "url_type": url_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of UrlRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::UrlRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = parsed_json["value"]
        url_type = parsed_json["url_type"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          value: value,
          url_type: url_type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of UrlRequest to a JSON object
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
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.url_type&.is_a?(Merge::Ats::UrlTypeEnum) != false || raise("Passed value for field obj.url_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
