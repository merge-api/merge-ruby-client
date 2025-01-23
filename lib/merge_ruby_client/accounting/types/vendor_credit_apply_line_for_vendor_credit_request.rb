# frozen_string_literal: true

require_relative "vendor_credit_apply_line_for_vendor_credit_request_invoice"
require "date"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The VendorCreditApplyLine Object
    #  ### Description
    #  The `VendorCreditApplyLine` object is used to represent a applied vendor credit.
    #  ### Usage Example
    #  Fetch from the `GET VendorCredit` endpoint and view the vendor credit's applied
    #  to lines.
    class VendorCreditApplyLineForVendorCreditRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Merge::Accounting::VendorCreditApplyLineForVendorCreditRequestInvoice]
      attr_reader :invoice
      # @return [DateTime] Date that the vendor credit is applied to the invoice.
      attr_reader :applied_date
      # @return [String] The amount of the VendorCredit applied to the invoice.
      attr_reader :applied_amount
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
      # @param invoice [Merge::Accounting::VendorCreditApplyLineForVendorCreditRequestInvoice]
      # @param applied_date [DateTime] Date that the vendor credit is applied to the invoice.
      # @param applied_amount [String] The amount of the VendorCredit applied to the invoice.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::VendorCreditApplyLineForVendorCreditRequest]
      def initialize(remote_id: OMIT, invoice: OMIT, applied_date: OMIT, applied_amount: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @invoice = invoice if invoice != OMIT
        @applied_date = applied_date if applied_date != OMIT
        @applied_amount = applied_amount if applied_amount != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "invoice": invoice,
          "applied_date": applied_date,
          "applied_amount": applied_amount,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  VendorCreditApplyLineForVendorCreditRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::VendorCreditApplyLineForVendorCreditRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        if parsed_json["invoice"].nil?
          invoice = nil
        else
          invoice = parsed_json["invoice"].to_json
          invoice = Merge::Accounting::VendorCreditApplyLineForVendorCreditRequestInvoice.from_json(json_object: invoice)
        end
        applied_date = (DateTime.parse(parsed_json["applied_date"]) unless parsed_json["applied_date"].nil?)
        applied_amount = parsed_json["applied_amount"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          remote_id: remote_id,
          invoice: invoice,
          applied_date: applied_date,
          applied_amount: applied_amount,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of VendorCreditApplyLineForVendorCreditRequest to a JSON
      #  object
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
        obj.invoice.nil? || Merge::Accounting::VendorCreditApplyLineForVendorCreditRequestInvoice.validate_raw(obj: obj.invoice)
        obj.applied_date&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_date is not the expected type, validation failed.")
        obj.applied_amount&.is_a?(String) != false || raise("Passed value for field obj.applied_amount is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
