# frozen_string_literal: true

require "date"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The PaymentLineItem Object
    #  ### Description
    #  The `PaymentLineItem` object is an applied-to-line on a `Payment` that can
    #  either be a `Invoice`, `CreditNote`, or `JournalEntry`.
    #  ### Usage Example
    #  `Payment` will have a field called `applied-to-lines` which will be an array of
    #  `PaymentLineItemInternalMappingSerializer` objects that can either be a
    #  `Invoice`, `CreditNote`, or `JournalEntry`.
    class PaymentLineItemRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [String] The amount being applied to the transaction.
      attr_reader :applied_amount
      # @return [DateTime] The date the payment portion is applied.
      attr_reader :applied_date
      # @return [String] The Merge ID of the transaction the payment portion is being applied to.
      attr_reader :related_object_id
      # @return [String] The type of transaction the payment portion is being applied to. Possible values
      #  include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
      attr_reader :related_object_type
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
      # @param applied_amount [String] The amount being applied to the transaction.
      # @param applied_date [DateTime] The date the payment portion is applied.
      # @param related_object_id [String] The Merge ID of the transaction the payment portion is being applied to.
      # @param related_object_type [String] The type of transaction the payment portion is being applied to. Possible values
      #  include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Accounting::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PaymentLineItemRequest]
      def initialize(remote_id: OMIT, applied_amount: OMIT, applied_date: OMIT, related_object_id: OMIT,
                     related_object_type: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @applied_amount = applied_amount if applied_amount != OMIT
        @applied_date = applied_date if applied_date != OMIT
        @related_object_id = related_object_id if related_object_id != OMIT
        @related_object_type = related_object_type if related_object_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "applied_amount": applied_amount,
          "applied_date": applied_date,
          "related_object_id": related_object_id,
          "related_object_type": related_object_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaymentLineItemRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PaymentLineItemRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        applied_amount = parsed_json["applied_amount"]
        applied_date = (DateTime.parse(parsed_json["applied_date"]) unless parsed_json["applied_date"].nil?)
        related_object_id = parsed_json["related_object_id"]
        related_object_type = parsed_json["related_object_type"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          remote_id: remote_id,
          applied_amount: applied_amount,
          applied_date: applied_date,
          related_object_id: related_object_id,
          related_object_type: related_object_type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaymentLineItemRequest to a JSON object
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
        obj.applied_amount&.is_a?(String) != false || raise("Passed value for field obj.applied_amount is not the expected type, validation failed.")
        obj.applied_date&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_date is not the expected type, validation failed.")
        obj.related_object_id&.is_a?(String) != false || raise("Passed value for field obj.related_object_id is not the expected type, validation failed.")
        obj.related_object_type&.is_a?(String) != false || raise("Passed value for field obj.related_object_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
