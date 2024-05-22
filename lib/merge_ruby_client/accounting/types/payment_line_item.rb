# frozen_string_literal: true

require "date"
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
    class PaymentLineItem
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The amount being applied to the transaction.
      attr_reader :applied_amount
      # @return [DateTime] The date the payment portion is applied.
      attr_reader :applied_date
      # @return [String] The Merge ID of the transaction the payment portion is being applied to.
      attr_reader :related_object_id
      # @return [String] The type of transaction the payment portion is being applied to. Possible values
      #  include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
      attr_reader :related_object_type
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
      # @param applied_amount [String] The amount being applied to the transaction.
      # @param applied_date [DateTime] The date the payment portion is applied.
      # @param related_object_id [String] The Merge ID of the transaction the payment portion is being applied to.
      # @param related_object_type [String] The type of transaction the payment portion is being applied to. Possible values
      #  include: INVOICE, JOURNAL_ENTRY, or CREDIT_NOTE.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PaymentLineItem]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, applied_amount: OMIT,
                     applied_date: OMIT, related_object_id: OMIT, related_object_type: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @applied_amount = applied_amount if applied_amount != OMIT
        @applied_date = applied_date if applied_date != OMIT
        @related_object_id = related_object_id if related_object_id != OMIT
        @related_object_type = related_object_type if related_object_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "applied_amount": applied_amount,
          "applied_date": applied_date,
          "related_object_id": related_object_id,
          "related_object_type": related_object_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaymentLineItem
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PaymentLineItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        applied_amount = struct["applied_amount"]
        applied_date = (DateTime.parse(parsed_json["applied_date"]) unless parsed_json["applied_date"].nil?)
        related_object_id = struct["related_object_id"]
        related_object_type = struct["related_object_type"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          applied_amount: applied_amount,
          applied_date: applied_date,
          related_object_id: related_object_id,
          related_object_type: related_object_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaymentLineItem to a JSON object
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
        obj.applied_amount&.is_a?(String) != false || raise("Passed value for field obj.applied_amount is not the expected type, validation failed.")
        obj.applied_date&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_date is not the expected type, validation failed.")
        obj.related_object_id&.is_a?(String) != false || raise("Passed value for field obj.related_object_id is not the expected type, validation failed.")
        obj.related_object_type&.is_a?(String) != false || raise("Passed value for field obj.related_object_type is not the expected type, validation failed.")
      end
    end
  end
end
