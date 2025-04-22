# frozen_string_literal: true

require "date"
require_relative "payment_term_company"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The PaymentTerm Object
    #  ### Description
    #  The `PaymentTerm` object is the agreed-upon conditions between a buyer and a
    #  seller that define the timing,
    #  amount, and conditions under which payment for goods or services must be made.
    #  ### Usage Example
    #  Fetch from the `GET PaymentTerm` endpoint and view payment term information.
    class PaymentTerm
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The name of the payment term.
      attr_reader :name
      # @return [Boolean] `True` if the payment term is active, `False` if not.
      attr_reader :is_active
      # @return [Merge::Accounting::PaymentTermCompany] The subsidiary that the payment term belongs to.
      attr_reader :company
      # @return [Integer] The number of days after the invoice date that payment is due.
      attr_reader :days_until_due
      # @return [Integer] The number of days the invoice must be paid before discounts expire.
      attr_reader :discount_days
      # @return [DateTime] When the third party's payment term was modified.
      attr_reader :remote_last_modified_at
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
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
      # @param name [String] The name of the payment term.
      # @param is_active [Boolean] `True` if the payment term is active, `False` if not.
      # @param company [Merge::Accounting::PaymentTermCompany] The subsidiary that the payment term belongs to.
      # @param days_until_due [Integer] The number of days after the invoice date that payment is due.
      # @param discount_days [Integer] The number of days the invoice must be paid before discounts expire.
      # @param remote_last_modified_at [DateTime] When the third party's payment term was modified.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PaymentTerm]
      def initialize(name:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, is_active: OMIT,
                     company: OMIT, days_until_due: OMIT, discount_days: OMIT, remote_last_modified_at: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name
        @is_active = is_active if is_active != OMIT
        @company = company if company != OMIT
        @days_until_due = days_until_due if days_until_due != OMIT
        @discount_days = discount_days if discount_days != OMIT
        @remote_last_modified_at = remote_last_modified_at if remote_last_modified_at != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "is_active": is_active,
          "company": company,
          "days_until_due": days_until_due,
          "discount_days": discount_days,
          "remote_last_modified_at": remote_last_modified_at,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaymentTerm
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PaymentTerm]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        is_active = parsed_json["is_active"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::PaymentTermCompany.from_json(json_object: company)
        end
        days_until_due = parsed_json["days_until_due"]
        discount_days = parsed_json["discount_days"]
        remote_last_modified_at = unless parsed_json["remote_last_modified_at"].nil?
                                    DateTime.parse(parsed_json["remote_last_modified_at"])
                                  end
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          is_active: is_active,
          company: company,
          days_until_due: days_until_due,
          discount_days: discount_days,
          remote_last_modified_at: remote_last_modified_at,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaymentTerm to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_active&.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::PaymentTermCompany.validate_raw(obj: obj.company)
        obj.days_until_due&.is_a?(Integer) != false || raise("Passed value for field obj.days_until_due is not the expected type, validation failed.")
        obj.discount_days&.is_a?(Integer) != false || raise("Passed value for field obj.discount_days is not the expected type, validation failed.")
        obj.remote_last_modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_last_modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
