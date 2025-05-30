# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The ReportItem Object
    #  ### Description
    #  The `ReportItem` object is used to represent a report item for a Balance Sheet,
    #  Cash Flow Statement or Profit and Loss Report.
    #  ### Usage Example
    #  Fetch from the `GET BalanceSheet` endpoint and view the balance sheet's report
    #  items.
    class ReportItem
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The report item's name.
      attr_reader :name
      # @return [Float] The report item's value.
      attr_reader :value
      # @return [Array<Hash{String => Object}>]
      attr_reader :sub_items
      # @return [String] The company the report item belongs to.
      attr_reader :company
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param name [String] The report item's name.
      # @param value [Float] The report item's value.
      # @param sub_items [Array<Hash{String => Object}>]
      # @param company [String] The company the report item belongs to.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ReportItem]
      def initialize(remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, value: OMIT, sub_items: OMIT,
                     company: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @value = value if value != OMIT
        @sub_items = sub_items if sub_items != OMIT
        @company = company if company != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "value": value,
          "sub_items": sub_items,
          "company": company,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ReportItem
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ReportItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        value = parsed_json["value"]
        sub_items = parsed_json["sub_items"]
        company = parsed_json["company"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          value: value,
          sub_items: sub_items,
          company: company,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of ReportItem to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.value&.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.sub_items&.is_a?(Array) != false || raise("Passed value for field obj.sub_items is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
