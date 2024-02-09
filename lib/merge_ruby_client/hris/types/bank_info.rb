# frozen_string_literal: true

require_relative "bank_info_employee"
require_relative "account_type_enum"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The BankInfo Object
    #
    # ### Description
    #
    # The `BankInfo` object is used to represent the Bank Account information for an Employee.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST BankInfo` endpoint and filter by `ID` to show all bank information.
    class BankInfo
      attr_reader :id, :remote_id, :employee, :account_number, :routing_number, :bank_name, :account_type,
                  :remote_created_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [Hris::BankInfoEmployee] The employee with this bank account.
      # @param account_number [String] The account number.
      # @param routing_number [String] The routing number.
      # @param bank_name [String] The bank name.
      # @param account_type [ACCOUNT_TYPE_ENUM] The bank account type
      #   - `SAVINGS` - SAVINGS
      #   - `CHECKING` - CHECKING
      # @param remote_created_at [DateTime] When the matching bank object was created in the third party system.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::BankInfo]
      def initialize(id: nil, remote_id: nil, employee: nil, account_number: nil, routing_number: nil, bank_name: nil,
                     account_type: nil, remote_created_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::BankInfoEmployee] The employee with this bank account.
        @employee = employee
        # @type [String] The account number.
        @account_number = account_number
        # @type [String] The routing number.
        @routing_number = routing_number
        # @type [String] The bank name.
        @bank_name = bank_name
        # @type [ACCOUNT_TYPE_ENUM] The bank account type
        #   - `SAVINGS` - SAVINGS
        #   - `CHECKING` - CHECKING
        @account_type = account_type
        # @type [DateTime] When the matching bank object was created in the third party system.
        @remote_created_at = remote_created_at
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hris::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BankInfo
      #
      # @param json_object [JSON]
      # @return [Hris::BankInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Hris::BankInfoEmployee.from_json(json_object: employee)
        end
        account_number = struct.account_number
        routing_number = struct.routing_number
        bank_name = struct.bank_name
        account_type = Hris::ACCOUNT_TYPE_ENUM.key(parsed_json["account_type"]) || parsed_json["account_type"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, employee: employee, account_number: account_number,
            routing_number: routing_number, bank_name: bank_name, account_type: account_type, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of BankInfo to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee": @employee,
          "account_number": @account_number,
          "routing_number": @routing_number,
          "bank_name": @bank_name,
          "account_type": Hris::ACCOUNT_TYPE_ENUM[@account_type] || @account_type,
          "remote_created_at": @remote_created_at,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.employee.nil? || Hris::BankInfoEmployee.validate_raw(obj: obj.employee)
        obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
        obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
        obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
        obj.account_type&.is_a?(Hris::ACCOUNT_TYPE_ENUM) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
