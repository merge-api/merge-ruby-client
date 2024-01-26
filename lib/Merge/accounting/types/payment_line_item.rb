# frozen_string_literal: true
require "date"
require "date"
require "date"
require "json"

module Merge
  module Accounting
    # # The PaymentLineItem Object 
### Description

The `PaymentLineItem` object is an applied-to-line on a `Payment` that can either be a `Invoice`, `CreditNote`, or `JournalEntry`.

### Usage Example

`Payment` will have a field called `applied-to-lines` which will be an array of `PaymentLineItemInternalMappingSerializer` objects that can either be a `Invoice`, `CreditNote`, or `JournalEntry`.
    class PaymentLineItem
      attr_reader :applied_amount, :applied_date, :remote_id, :related_object_id, :related_object_type, :id, :created_at, :modified_at, :additional_properties
      # @param applied_amount [String] The amount being applied to the transaction.
      # @param applied_date [DateTime] The date the payment portion is applied.
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param related_object_id [String] The Merge ID of the transaction the payment portion is being applied to.
      # @param related_object_type [String] The type of transaction the payment portion is being applied to. Possible values include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
      # @param id [String] 
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::PaymentLineItem]
      def initialize(applied_amount: nil, applied_date: nil, remote_id: nil, related_object_id: nil, related_object_type: nil, id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The amount being applied to the transaction.
        @applied_amount = applied_amount
        # @type [DateTime] The date the payment portion is applied.
        @applied_date = applied_date
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The Merge ID of the transaction the payment portion is being applied to.
        @related_object_id = related_object_id
        # @type [String] The type of transaction the payment portion is being applied to. Possible values include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
        @related_object_type = related_object_type
        # @type [String] 
        @id = id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of PaymentLineItem
      #
      # @param json_object [JSON] 
      # @return [Accounting::PaymentLineItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        applied_amount = struct.applied_amount
        applied_date = DateTime.parse(struct.applied_date)
        remote_id = struct.remote_id
        related_object_id = struct.related_object_id
        related_object_type = struct.related_object_type
        id = struct.id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(applied_amount: applied_amount, applied_date: applied_date, remote_id: remote_id, related_object_id: related_object_id, related_object_type: related_object_type, id: id, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of PaymentLineItem to a JSON object
      #
      # @return [JSON]
      def to_json
        { "applied_amount": @applied_amount, "applied_date": @applied_date, "remote_id": @remote_id, "related_object_id": @related_object_id, "related_object_type": @related_object_type, "id": @id, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.applied_amount&.is_a?(String) != false || raise("Passed value for field obj.applied_amount is not the expected type, validation failed.")
        obj.applied_date&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_date is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.related_object_id&.is_a?(String) != false || raise("Passed value for field obj.related_object_id is not the expected type, validation failed.")
        obj.related_object_type&.is_a?(String) != false || raise("Passed value for field obj.related_object_type is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end