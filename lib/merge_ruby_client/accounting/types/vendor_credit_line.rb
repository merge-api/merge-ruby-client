# frozen_string_literal: true

require_relative "vendor_credit_line_account"
require "date"
require "json"

module Merge
  module Accounting
    # # The VendorCreditLine Object
    #
    # ### Description
    #
    # The `VendorCreditLine` object is used to represent a vendor credit's line items.
    #
    # ### Usage Example
    #
    # Fetch from the `GET VendorCredit` endpoint and view the vendor credit's line items.
    class VendorCreditLine
      attr_reader :remote_id, :net_amount, :tracking_category, :tracking_categories, :description, :account, :company,
                  :exchange_rate, :remote_was_deleted, :id, :created_at, :modified_at, :additional_properties

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param net_amount [Float] The full value of the credit.
      # @param tracking_category [String] The line's associated tracking category.
      # @param tracking_categories [Array<String>] The line's associated tracking categories.
      # @param description [String] The line's description.
      # @param account [Accounting::VendorCreditLineAccount] The line's account.
      # @param company [String] The company the line belongs to.
      # @param exchange_rate [String] The vendor credit line item's exchange rate.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::VendorCreditLine]
      def initialize(tracking_categories:, remote_id: nil, net_amount: nil, tracking_category: nil, description: nil,
                     account: nil, company: nil, exchange_rate: nil, remote_was_deleted: nil, id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Float] The full value of the credit.
        @net_amount = net_amount
        # @type [String] The line's associated tracking category.
        @tracking_category = tracking_category
        # @type [Array<String>] The line's associated tracking categories.
        @tracking_categories = tracking_categories
        # @type [String] The line's description.
        @description = description
        # @type [Accounting::VendorCreditLineAccount] The line's account.
        @account = account
        # @type [String] The company the line belongs to.
        @company = company
        # @type [String] The vendor credit line item's exchange rate.
        @exchange_rate = exchange_rate
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [String]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of VendorCreditLine
      #
      # @param json_object [JSON]
      # @return [Accounting::VendorCreditLine]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = struct.remote_id
        net_amount = struct.net_amount
        tracking_category = struct.tracking_category
        tracking_categories = struct.tracking_categories
        description = struct.description
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Accounting::VendorCreditLineAccount.from_json(json_object: account)
        end
        company = struct.company
        exchange_rate = struct.exchange_rate
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(remote_id: remote_id, net_amount: net_amount, tracking_category: tracking_category,
            tracking_categories: tracking_categories, description: description, account: account, company: company, exchange_rate: exchange_rate, remote_was_deleted: remote_was_deleted, id: id, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of VendorCreditLine to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "remote_id": @remote_id,
          "net_amount": @net_amount,
          "tracking_category": @tracking_category,
          "tracking_categories": @tracking_categories,
          "description": @description,
          "account": @account,
          "company": @company,
          "exchange_rate": @exchange_rate,
          "remote_was_deleted": @remote_was_deleted,
          "id": @id,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.net_amount&.is_a?(Float) != false || raise("Passed value for field obj.net_amount is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.account.nil? || Accounting::VendorCreditLineAccount.validate_raw(obj: obj.account)
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
