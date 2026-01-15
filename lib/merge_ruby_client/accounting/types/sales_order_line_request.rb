# frozen_string_literal: true

require "date"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The SalesOrderLine Object
    #  ### Description
    #  The `SalesOrderLine` object represents a specific line item on a sales order.
    #  ### Usage Example
    #  Fetch from the `GET SalesOrder` endpoint and view a company's sales order line
    #  items.
    class SalesOrderLineRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [String] Description of the line item.
      attr_reader :description
      # @return [String] The unit price of the item.
      attr_reader :unit_price
      # @return [String] Quantity ordered for this line.
      attr_reader :quantity
      # @return [String]
      attr_reader :item
      # @return [String] The tax rate of the line item.
      attr_reader :tax_rate
      # @return [Array<String>] The dimensions or classification tags.
      attr_reader :tracking_categories
      # @return [String] The subsidiary associated with the order.
      attr_reader :company
      # @return [DateTime] When the third party's sales order line item was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's sales order line item was updated.
      attr_reader :remote_updated_at
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

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param description [String] Description of the line item.
      # @param unit_price [String] The unit price of the item.
      # @param quantity [String] Quantity ordered for this line.
      # @param item [String]
      # @param tax_rate [String] The tax rate of the line item.
      # @param tracking_categories [Array<String>] The dimensions or classification tags.
      # @param company [String] The subsidiary associated with the order.
      # @param remote_created_at [DateTime] When the third party's sales order line item was created.
      # @param remote_updated_at [DateTime] When the third party's sales order line item was updated.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Accounting::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::SalesOrderLineRequest]
      def initialize(remote_id: OMIT, description: OMIT, unit_price: OMIT, quantity: OMIT, item: OMIT, tax_rate: OMIT,
                     tracking_categories: OMIT, company: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @description = description if description != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @quantity = quantity if quantity != OMIT
        @item = item if item != OMIT
        @tax_rate = tax_rate if tax_rate != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @company = company if company != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "description": description,
          "unit_price": unit_price,
          "quantity": quantity,
          "item": item,
          "tax_rate": tax_rate,
          "tracking_categories": tracking_categories,
          "company": company,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SalesOrderLineRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::SalesOrderLineRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        description = parsed_json["description"]
        unit_price = parsed_json["unit_price"]
        quantity = parsed_json["quantity"]
        item = parsed_json["item"]
        tax_rate = parsed_json["tax_rate"]
        tracking_categories = parsed_json["tracking_categories"]
        company = parsed_json["company"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          remote_id: remote_id,
          description: description,
          unit_price: unit_price,
          quantity: quantity,
          item: item,
          tax_rate: tax_rate,
          tracking_categories: tracking_categories,
          company: company,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of SalesOrderLineRequest to a JSON object
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
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.unit_price&.is_a?(String) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
        obj.item&.is_a?(String) != false || raise("Passed value for field obj.item is not the expected type, validation failed.")
        obj.tax_rate&.is_a?(String) != false || raise("Passed value for field obj.tax_rate is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
