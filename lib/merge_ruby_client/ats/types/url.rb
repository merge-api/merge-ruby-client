# frozen_string_literal: true

require "date"
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
    class Url
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The site's url.
      attr_reader :value
      # @return [Merge::Ats::UrlTypeEnum] The type of site.
      #  - `PERSONAL` - PERSONAL
      #  - `COMPANY` - COMPANY
      #  - `PORTFOLIO` - PORTFOLIO
      #  - `BLOG` - BLOG
      #  - `SOCIAL_MEDIA` - SOCIAL_MEDIA
      #  - `OTHER` - OTHER
      #  - `JOB_POSTING` - JOB_POSTING
      attr_reader :url_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param value [String] The site's url.
      # @param url_type [Merge::Ats::UrlTypeEnum] The type of site.
      #  - `PERSONAL` - PERSONAL
      #  - `COMPANY` - COMPANY
      #  - `PORTFOLIO` - PORTFOLIO
      #  - `BLOG` - BLOG
      #  - `SOCIAL_MEDIA` - SOCIAL_MEDIA
      #  - `OTHER` - OTHER
      #  - `JOB_POSTING` - JOB_POSTING
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Url]
      def initialize(created_at: OMIT, modified_at: OMIT, value: OMIT, url_type: OMIT, additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @value = value if value != OMIT
        @url_type = url_type if url_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "value": value,
          "url_type": url_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Url
      #
      # @param json_object [String]
      # @return [Merge::Ats::Url]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        value = parsed_json["value"]
        url_type = parsed_json["url_type"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          value: value,
          url_type: url_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of Url to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.url_type&.is_a?(Merge::Ats::UrlTypeEnum) != false || raise("Passed value for field obj.url_type is not the expected type, validation failed.")
      end
    end
  end
end
