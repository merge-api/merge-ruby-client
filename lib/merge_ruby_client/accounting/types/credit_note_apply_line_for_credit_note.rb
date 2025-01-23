# frozen_string_literal: true

require "date"
require_relative "credit_note_apply_line_for_credit_note_invoice"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The CreditNoteApplyLine Object
    #  ### Description
    #  The `CreditNoteApplyLine` is attached to the CreditNote model.
    #  ### Usage Example
    #  Fetch from the `GET CreditNote` endpoint and view the invoice's applied to
    #  lines.
    class CreditNoteApplyLineForCreditNote
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::CreditNoteApplyLineForCreditNoteInvoice]
      attr_reader :invoice
      # @return [DateTime] Date that the credit note is applied to the invoice.
      attr_reader :applied_date
      # @return [String] The amount of the Credit Note applied to the invoice.
      attr_reader :applied_amount
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
      # @param invoice [Merge::Accounting::CreditNoteApplyLineForCreditNoteInvoice]
      # @param applied_date [DateTime] Date that the credit note is applied to the invoice.
      # @param applied_amount [String] The amount of the Credit Note applied to the invoice.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::CreditNoteApplyLineForCreditNote]
      def initialize(remote_id: OMIT, created_at: OMIT, modified_at: OMIT, invoice: OMIT, applied_date: OMIT,
                     applied_amount: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @invoice = invoice if invoice != OMIT
        @applied_date = applied_date if applied_date != OMIT
        @applied_amount = applied_amount if applied_amount != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "invoice": invoice,
          "applied_date": applied_date,
          "applied_amount": applied_amount,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CreditNoteApplyLineForCreditNote
      #
      # @param json_object [String]
      # @return [Merge::Accounting::CreditNoteApplyLineForCreditNote]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["invoice"].nil?
          invoice = nil
        else
          invoice = parsed_json["invoice"].to_json
          invoice = Merge::Accounting::CreditNoteApplyLineForCreditNoteInvoice.from_json(json_object: invoice)
        end
        applied_date = (DateTime.parse(parsed_json["applied_date"]) unless parsed_json["applied_date"].nil?)
        applied_amount = parsed_json["applied_amount"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          invoice: invoice,
          applied_date: applied_date,
          applied_amount: applied_amount,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of CreditNoteApplyLineForCreditNote to a JSON object
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
        obj.invoice.nil? || Merge::Accounting::CreditNoteApplyLineForCreditNoteInvoice.validate_raw(obj: obj.invoice)
        obj.applied_date&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_date is not the expected type, validation failed.")
        obj.applied_amount&.is_a?(String) != false || raise("Passed value for field obj.applied_amount is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
