# frozen_string_literal: true
require_relative "url_url_type"
require "date"
require "date"
require "json"

module Merge
  module Ats
    # # The Url Object 
### Description

The `Url` object is used to represent hyperlinks associated with the parent model.

### Usage Example

Fetch from the `GET Candidate` endpoint and view their website urls.
    class Url
      attr_reader :value, :url_type, :created_at, :modified_at, :additional_properties
      # @param value [String] The site's url.
      # @param url_type [Ats::UrlUrlType] The type of site.  - `PERSONAL` - PERSONAL
- `COMPANY` - COMPANY
- `PORTFOLIO` - PORTFOLIO
- `BLOG` - BLOG
- `SOCIAL_MEDIA` - SOCIAL_MEDIA
- `OTHER` - OTHER
- `JOB_POSTING` - JOB_POSTING
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Url]
      def initialize(value: nil, url_type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The site's url.
        @value = value
        # @type [Ats::UrlUrlType] The type of site. 
- `PERSONAL` - PERSONAL
- `COMPANY` - COMPANY
- `PORTFOLIO` - PORTFOLIO
- `BLOG` - BLOG
- `SOCIAL_MEDIA` - SOCIAL_MEDIA
- `OTHER` - OTHER
- `JOB_POSTING` - JOB_POSTING
        @url_type = url_type
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Url
      #
      # @param json_object [JSON] 
      # @return [Ats::Url]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        value = struct.value
        url_type = struct.url_type.to_h.to_json()
        url_type = Ats::UrlUrlType.from_json(json_object: url_type)
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(value: value, url_type: url_type, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of Url to a JSON object
      #
      # @return [JSON]
      def to_json
        { "value": @value, "url_type": @url_type, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.url_type.nil?() || Ats::UrlUrlType.validate_raw(obj: obj.url_type)
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end