# frozen_string_literal: true

require "json"
require_relative "accounting_period"

module Merge
  module Accounting
    # The accounting period that the CreditNote was generated in.
    class CreditNoteRequestAccountingPeriod
      # Deserialize a JSON object to an instance of CreditNoteRequestAccountingPeriod
      #
      # @param json_object [String]
      # @return [Merge::Accounting::CreditNoteRequestAccountingPeriod]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return struct unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Merge::Accounting::AccountingPeriod.validate_raw(obj: struct)
          return Merge::Accounting::AccountingPeriod.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return Merge::Accounting::AccountingPeriod.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
