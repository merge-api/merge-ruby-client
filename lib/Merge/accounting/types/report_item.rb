# frozen_string_literal: true
require "date"
require "date"
require "json"

module Merge
  module Accounting
    # # The ReportItem Object 
### Description

The `ReportItem` object is used to represent a report item for a Balance Sheet, Cash Flow Statement or Profit and Loss Report.

### Usage Example

Fetch from the `GET BalanceSheet` endpoint and view the balance sheet's report items.
    class ReportItem
      attr_reader :remote_id, :name, :value, :sub_items, :company, :created_at, :modified_at, :additional_properties
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The report item's name.
      # @param value [Float] The report item's value.
      # @param sub_items [Array<Hash>] 
      # @param company [String] The company the report item belongs to.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::ReportItem]
      def initialize(remote_id: nil, name: nil, value: nil, sub_items: nil, company: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The report item's name.
        @name = name
        # @type [Float] The report item's value.
        @value = value
        # @type [Array<Hash>] 
        @sub_items = sub_items
        # @type [String] The company the report item belongs to.
        @company = company
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ReportItem
      #
      # @param json_object [JSON] 
      # @return [Accounting::ReportItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        remote_id = struct.remote_id
        name = struct.name
        value = struct.value
        sub_items = struct.sub_items
        company = struct.company
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(remote_id: remote_id, name: name, value: value, sub_items: sub_items, company: company, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of ReportItem to a JSON object
      #
      # @return [JSON]
      def to_json
        { "remote_id": @remote_id, "name": @name, "value": @value, "sub_items": @sub_items, "company": @company, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.value&.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.sub_items&.is_a?(Array) != false || raise("Passed value for field obj.sub_items is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end