# frozen_string_literal: true

require "date"
require_relative "vendor_credit_line_account"
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
    class VendorCreditLine
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Float] The full value of the credit.
      attr_reader :net_amount
      # @return [String] The line's associated tracking category.
      attr_reader :tracking_category
      # @return [Array<String>] The line's associated tracking categories.
      attr_reader :tracking_categories
      # @return [String] The line's description.
      attr_reader :description
      # @return [Merge::Accounting::VendorCreditLineAccount] The line's account.
      attr_reader :account
      # @return [String] The company the line belongs to.
      attr_reader :company
      # @return [String] The vendor credit line item's exchange rate.
      attr_reader :exchange_rate
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
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
      # @param net_amount [Float] The full value of the credit.
      # @param tracking_category [String] The line's associated tracking category.
      # @param tracking_categories [Array<String>] The line's associated tracking categories.
      # @param description [String] The line's description.
      # @param account [Merge::Accounting::VendorCreditLineAccount] The line's account.
      # @param company [String] The company the line belongs to.
      # @param exchange_rate [String] The vendor credit line item's exchange rate.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::VendorCreditLine]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, net_amount: OMIT,
                     tracking_category: OMIT, tracking_categories: OMIT, description: OMIT, account: OMIT, company: OMIT, exchange_rate: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @net_amount = net_amount if net_amount != OMIT
        @tracking_category = tracking_category if tracking_category != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @description = description if description != OMIT
        @account = account if account != OMIT
        @company = company if company != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "net_amount": net_amount,
          "tracking_category": tracking_category,
          "tracking_categories": tracking_categories,
          "description": description,
          "account": account,
          "company": company,
          "exchange_rate": exchange_rate,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VendorCreditLine
      #
      # @param json_object [String]
      # @return [Merge::Accounting::VendorCreditLine]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        net_amount = parsed_json["net_amount"]
        tracking_category = parsed_json["tracking_category"]
        tracking_categories = parsed_json["tracking_categories"]
        description = parsed_json["description"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Accounting::VendorCreditLineAccount.from_json(json_object: account)
        end
        company = parsed_json["company"]
        exchange_rate = parsed_json["exchange_rate"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          net_amount: net_amount,
          tracking_category: tracking_category,
          tracking_categories: tracking_categories,
          description: description,
          account: account,
          company: company,
          exchange_rate: exchange_rate,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of VendorCreditLine to a JSON object
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
        obj.net_amount&.is_a?(Float) != false || raise("Passed value for field obj.net_amount is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.account.nil? || Merge::Accounting::VendorCreditLineAccount.validate_raw(obj: obj.account)
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
