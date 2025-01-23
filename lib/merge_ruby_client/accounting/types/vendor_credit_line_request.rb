# frozen_string_literal: true

require_relative "vendor_credit_line_request_account"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The VendorCreditLine Object
    #  ### Description
    #  The `VendorCreditLine` object is used to represent a vendor credit's line items.
    #  ### Usage Example
    #  Fetch from the `GET VendorCredit` endpoint and view the vendor credit's line
    #  items.
    class VendorCreditLineRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Float] The full value of the credit.
      attr_reader :net_amount
      # @return [String] The line's associated tracking category.
      attr_reader :tracking_category
      # @return [Array<String>] The vendor credit line item's associated tracking categories.
      attr_reader :tracking_categories
      # @return [String] The line's description.
      attr_reader :description
      # @return [Merge::Accounting::VendorCreditLineRequestAccount] The line's account.
      attr_reader :account
      # @return [String] The company the line belongs to.
      attr_reader :company
      # @return [String] The tax rate that applies to this line item.
      attr_reader :tax_rate
      # @return [String] The vendor credit line item's exchange rate.
      attr_reader :exchange_rate
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

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param net_amount [Float] The full value of the credit.
      # @param tracking_category [String] The line's associated tracking category.
      # @param tracking_categories [Array<String>] The vendor credit line item's associated tracking categories.
      # @param description [String] The line's description.
      # @param account [Merge::Accounting::VendorCreditLineRequestAccount] The line's account.
      # @param company [String] The company the line belongs to.
      # @param tax_rate [String] The tax rate that applies to this line item.
      # @param exchange_rate [String] The vendor credit line item's exchange rate.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::VendorCreditLineRequest]
      def initialize(remote_id: OMIT, net_amount: OMIT, tracking_category: OMIT, tracking_categories: OMIT,
                     description: OMIT, account: OMIT, company: OMIT, tax_rate: OMIT, exchange_rate: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @net_amount = net_amount if net_amount != OMIT
        @tracking_category = tracking_category if tracking_category != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @description = description if description != OMIT
        @account = account if account != OMIT
        @company = company if company != OMIT
        @tax_rate = tax_rate if tax_rate != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "net_amount": net_amount,
          "tracking_category": tracking_category,
          "tracking_categories": tracking_categories,
          "description": description,
          "account": account,
          "company": company,
          "tax_rate": tax_rate,
          "exchange_rate": exchange_rate,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VendorCreditLineRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::VendorCreditLineRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        net_amount = parsed_json["net_amount"]
        tracking_category = parsed_json["tracking_category"]
        tracking_categories = parsed_json["tracking_categories"]
        description = parsed_json["description"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Accounting::VendorCreditLineRequestAccount.from_json(json_object: account)
        end
        company = parsed_json["company"]
        tax_rate = parsed_json["tax_rate"]
        exchange_rate = parsed_json["exchange_rate"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          remote_id: remote_id,
          net_amount: net_amount,
          tracking_category: tracking_category,
          tracking_categories: tracking_categories,
          description: description,
          account: account,
          company: company,
          tax_rate: tax_rate,
          exchange_rate: exchange_rate,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of VendorCreditLineRequest to a JSON object
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
        obj.net_amount&.is_a?(Float) != false || raise("Passed value for field obj.net_amount is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.account.nil? || Merge::Accounting::VendorCreditLineRequestAccount.validate_raw(obj: obj.account)
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.tax_rate&.is_a?(String) != false || raise("Passed value for field obj.tax_rate is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
