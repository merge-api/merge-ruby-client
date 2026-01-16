# frozen_string_literal: true

require "date"
require_relative "item_fulfillment_status_enum"
require_relative "item_fulfillment_line"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The ItemFulfillment Object
    #  ### Description
    #  The `ItemFulfillment` object represents the recorded shipment or delivery of
    #  some or all items on an associated sales order.
    #  ### Usage Example
    #  Fetch from the `LIST ItemFulfillments` endpoint and view a company's item
    #  fulfillments.
    class ItemFulfillment
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The ID of the sales order that the item fulfillment originated from.
      attr_reader :sales_order
      # @return [DateTime] The date the fulfillment was created.
      attr_reader :fulfillment_date
      # @return [String] The customer associated with the item fulfillment.
      attr_reader :customer
      # @return [String] The subsidiary associated with the fulfillment.
      attr_reader :company
      # @return [Merge::Accounting::ItemFulfillmentStatusEnum] The status of the item fulfillment.
      #  * `DRAFT` - DRAFT
      #  * `IN_PROGRESS` - IN_PROGRESS
      #  * `SHIPPED` - SHIPPED
      #  * `CANCELLED` - CANCELLED
      attr_reader :status
      # @return [String] Comment attached to the fulfillment.
      attr_reader :memo
      # @return [Array<Merge::Accounting::ItemFulfillmentLine>]
      attr_reader :lines
      # @return [DateTime] When the third party's item fulfillment was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's item fulfillment was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
      # @return [Array<Merge::Accounting::RemoteField>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param sales_order [String] The ID of the sales order that the item fulfillment originated from.
      # @param fulfillment_date [DateTime] The date the fulfillment was created.
      # @param customer [String] The customer associated with the item fulfillment.
      # @param company [String] The subsidiary associated with the fulfillment.
      # @param status [Merge::Accounting::ItemFulfillmentStatusEnum] The status of the item fulfillment.
      #  * `DRAFT` - DRAFT
      #  * `IN_PROGRESS` - IN_PROGRESS
      #  * `SHIPPED` - SHIPPED
      #  * `CANCELLED` - CANCELLED
      # @param memo [String] Comment attached to the fulfillment.
      # @param lines [Array<Merge::Accounting::ItemFulfillmentLine>]
      # @param remote_created_at [DateTime] When the third party's item fulfillment was created.
      # @param remote_updated_at [DateTime] When the third party's item fulfillment was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param remote_fields [Array<Merge::Accounting::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ItemFulfillment]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, sales_order: OMIT,
                     fulfillment_date: OMIT, customer: OMIT, company: OMIT, status: OMIT, memo: OMIT, lines: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @sales_order = sales_order if sales_order != OMIT
        @fulfillment_date = fulfillment_date if fulfillment_date != OMIT
        @customer = customer if customer != OMIT
        @company = company if company != OMIT
        @status = status if status != OMIT
        @memo = memo if memo != OMIT
        @lines = lines if lines != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "sales_order": sales_order,
          "fulfillment_date": fulfillment_date,
          "customer": customer,
          "company": company,
          "status": status,
          "memo": memo,
          "lines": lines,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ItemFulfillment
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ItemFulfillment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        sales_order = parsed_json["sales_order"]
        fulfillment_date = (DateTime.parse(parsed_json["fulfillment_date"]) unless parsed_json["fulfillment_date"].nil?)
        customer = parsed_json["customer"]
        company = parsed_json["company"]
        status = parsed_json["status"]
        memo = parsed_json["memo"]
        lines = parsed_json["lines"]&.map do |item|
          item = item.to_json
          Merge::Accounting::ItemFulfillmentLine.from_json(json_object: item)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          sales_order: sales_order,
          fulfillment_date: fulfillment_date,
          customer: customer,
          company: company,
          status: status,
          memo: memo,
          lines: lines,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of ItemFulfillment to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.sales_order&.is_a?(String) != false || raise("Passed value for field obj.sales_order is not the expected type, validation failed.")
        obj.fulfillment_date&.is_a?(DateTime) != false || raise("Passed value for field obj.fulfillment_date is not the expected type, validation failed.")
        obj.customer&.is_a?(String) != false || raise("Passed value for field obj.customer is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::ItemFulfillmentStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.lines&.is_a?(Array) != false || raise("Passed value for field obj.lines is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
