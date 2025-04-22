# frozen_string_literal: true

require "date"
require_relative "method_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The PaymentMethod Object
    #  ### Description
    #  The `PaymentMethod` object defines how a payment against an invoice is made.
    #  ### Usage Example
    #  Fetch from the `GET PaymentMethod` endpoint and view payment method information.
    class PaymentMethod
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::MethodTypeEnum] The type of the payment method.
      #  * `CREDIT_CARD` - CREDIT_CARD
      #  * `DEBIT_CARD` - DEBIT_CARD
      #  * `ACH` - ACH
      #  * `CASH` - CASH
      #  * `CHECK` - CHECK
      attr_reader :method_type
      # @return [String] The payment method’s name
      attr_reader :name
      # @return [Boolean] `True` if the payment method is active, `False` if not.
      attr_reader :is_active
      # @return [DateTime] When the third party's payment method was updated.
      attr_reader :remote_updated_at
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
      # @param method_type [Merge::Accounting::MethodTypeEnum] The type of the payment method.
      #  * `CREDIT_CARD` - CREDIT_CARD
      #  * `DEBIT_CARD` - DEBIT_CARD
      #  * `ACH` - ACH
      #  * `CASH` - CASH
      #  * `CHECK` - CHECK
      # @param name [String] The payment method’s name
      # @param is_active [Boolean] `True` if the payment method is active, `False` if not.
      # @param remote_updated_at [DateTime] When the third party's payment method was updated.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PaymentMethod]
      def initialize(method_type:, name:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT,
                     is_active: OMIT, remote_updated_at: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @method_type = method_type
        @name = name
        @is_active = is_active if is_active != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "method_type": method_type,
          "name": name,
          "is_active": is_active,
          "remote_updated_at": remote_updated_at,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaymentMethod
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PaymentMethod]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        method_type = parsed_json["method_type"]
        name = parsed_json["name"]
        is_active = parsed_json["is_active"]
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
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
          method_type: method_type,
          name: name,
          is_active: is_active,
          remote_updated_at: remote_updated_at,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaymentMethod to a JSON object
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
        obj.method_type.is_a?(Merge::Accounting::MethodTypeEnum) != false || raise("Passed value for field obj.method_type is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_active&.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
