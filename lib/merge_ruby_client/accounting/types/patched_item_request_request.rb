# frozen_string_literal: true

require_relative "status_7_d_1_enum"
require_relative "type_2_bb_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Item Object
    #  ### Description
    #  The `Item` object refers to the goods involved in a transaction.
    #  ### Usage Example
    #  Fetch from the `LIST Items` endpoint and view a company's items.
    class PatchedItemRequestRequest
      # @return [String] The item's name.
      attr_reader :name
      # @return [Merge::Accounting::Status7D1Enum] The item's status.
      #  * `ACTIVE` - ACTIVE
      #  * `ARCHIVED` - ARCHIVED
      attr_reader :status
      # @return [Merge::Accounting::Type2BbEnum] The item's type.
      #  * `INVENTORY` - INVENTORY
      #  * `NON_INVENTORY` - NON_INVENTORY
      #  * `SERVICE` - SERVICE
      #  * `UNKNOWN` - UNKNOWN
      attr_reader :type
      # @return [Float] The item's unit price.
      attr_reader :unit_price
      # @return [Float] The price at which the item is purchased from a vendor.
      attr_reader :purchase_price
      # @return [String] References the default account used to record a purchase of the item.
      attr_reader :purchase_account
      # @return [String] References the default account used to record a sale.
      attr_reader :sales_account
      # @return [String] The company the item belongs to.
      attr_reader :company
      # @return [String] The default purchase tax rate for this item.
      attr_reader :purchase_tax_rate
      # @return [String] The default sales tax rate for this item.
      attr_reader :sales_tax_rate
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

      # @param name [String] The item's name.
      # @param status [Merge::Accounting::Status7D1Enum] The item's status.
      #  * `ACTIVE` - ACTIVE
      #  * `ARCHIVED` - ARCHIVED
      # @param type [Merge::Accounting::Type2BbEnum] The item's type.
      #  * `INVENTORY` - INVENTORY
      #  * `NON_INVENTORY` - NON_INVENTORY
      #  * `SERVICE` - SERVICE
      #  * `UNKNOWN` - UNKNOWN
      # @param unit_price [Float] The item's unit price.
      # @param purchase_price [Float] The price at which the item is purchased from a vendor.
      # @param purchase_account [String] References the default account used to record a purchase of the item.
      # @param sales_account [String] References the default account used to record a sale.
      # @param company [String] The company the item belongs to.
      # @param purchase_tax_rate [String] The default purchase tax rate for this item.
      # @param sales_tax_rate [String] The default sales tax rate for this item.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PatchedItemRequestRequest]
      def initialize(name: OMIT, status: OMIT, type: OMIT, unit_price: OMIT, purchase_price: OMIT,
                     purchase_account: OMIT, sales_account: OMIT, company: OMIT, purchase_tax_rate: OMIT, sales_tax_rate: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @status = status if status != OMIT
        @type = type if type != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @purchase_price = purchase_price if purchase_price != OMIT
        @purchase_account = purchase_account if purchase_account != OMIT
        @sales_account = sales_account if sales_account != OMIT
        @company = company if company != OMIT
        @purchase_tax_rate = purchase_tax_rate if purchase_tax_rate != OMIT
        @sales_tax_rate = sales_tax_rate if sales_tax_rate != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "status": status,
          "type": type,
          "unit_price": unit_price,
          "purchase_price": purchase_price,
          "purchase_account": purchase_account,
          "sales_account": sales_account,
          "company": company,
          "purchase_tax_rate": purchase_tax_rate,
          "sales_tax_rate": sales_tax_rate,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PatchedItemRequestRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PatchedItemRequestRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        status = parsed_json["status"]
        type = parsed_json["type"]
        unit_price = parsed_json["unit_price"]
        purchase_price = parsed_json["purchase_price"]
        purchase_account = parsed_json["purchase_account"]
        sales_account = parsed_json["sales_account"]
        company = parsed_json["company"]
        purchase_tax_rate = parsed_json["purchase_tax_rate"]
        sales_tax_rate = parsed_json["sales_tax_rate"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          name: name,
          status: status,
          type: type,
          unit_price: unit_price,
          purchase_price: purchase_price,
          purchase_account: purchase_account,
          sales_account: sales_account,
          company: company,
          purchase_tax_rate: purchase_tax_rate,
          sales_tax_rate: sales_tax_rate,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of PatchedItemRequestRequest to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.type&.is_a?(Merge::Accounting::Type2BbEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.purchase_price&.is_a?(Float) != false || raise("Passed value for field obj.purchase_price is not the expected type, validation failed.")
        obj.purchase_account&.is_a?(String) != false || raise("Passed value for field obj.purchase_account is not the expected type, validation failed.")
        obj.sales_account&.is_a?(String) != false || raise("Passed value for field obj.sales_account is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.purchase_tax_rate&.is_a?(String) != false || raise("Passed value for field obj.purchase_tax_rate is not the expected type, validation failed.")
        obj.sales_tax_rate&.is_a?(String) != false || raise("Passed value for field obj.sales_tax_rate is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
