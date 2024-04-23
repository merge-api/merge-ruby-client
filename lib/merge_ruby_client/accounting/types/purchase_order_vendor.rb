# frozen_string_literal: true

require "json"
require_relative "contact"

module Merge
  module Accounting
    # The party fulfilling the purchase order.
    class PurchaseOrderVendor
      # Deserialize a JSON object to an instance of PurchaseOrderVendor
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PurchaseOrderVendor]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return json_object unless json_object.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Merge::Accounting::Contact.validate_raw(obj: struct)
          return Merge::Accounting::Contact.from_json(json_object: json_object) unless json_object.nil?

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
          return Merge::Accounting::Contact.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
