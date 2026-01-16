# frozen_string_literal: true

require "date"
require_relative "item_fulfillment_status_enum"
require_relative "remote_field_request"
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
    class ItemFulfillmentRequest
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
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Accounting::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

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
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Accounting::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ItemFulfillmentRequest]
      def initialize(sales_order: OMIT, fulfillment_date: OMIT, customer: OMIT, company: OMIT, status: OMIT,
                     memo: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @sales_order = sales_order if sales_order != OMIT
        @fulfillment_date = fulfillment_date if fulfillment_date != OMIT
        @customer = customer if customer != OMIT
        @company = company if company != OMIT
        @status = status if status != OMIT
        @memo = memo if memo != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "sales_order": sales_order,
          "fulfillment_date": fulfillment_date,
          "customer": customer,
          "company": company,
          "status": status,
          "memo": memo,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ItemFulfillmentRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ItemFulfillmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        sales_order = parsed_json["sales_order"]
        fulfillment_date = (DateTime.parse(parsed_json["fulfillment_date"]) unless parsed_json["fulfillment_date"].nil?)
        customer = parsed_json["customer"]
        company = parsed_json["company"]
        status = parsed_json["status"]
        memo = parsed_json["memo"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          sales_order: sales_order,
          fulfillment_date: fulfillment_date,
          customer: customer,
          company: company,
          status: status,
          memo: memo,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of ItemFulfillmentRequest to a JSON object
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
        obj.sales_order&.is_a?(String) != false || raise("Passed value for field obj.sales_order is not the expected type, validation failed.")
        obj.fulfillment_date&.is_a?(DateTime) != false || raise("Passed value for field obj.fulfillment_date is not the expected type, validation failed.")
        obj.customer&.is_a?(String) != false || raise("Passed value for field obj.customer is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::ItemFulfillmentStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
