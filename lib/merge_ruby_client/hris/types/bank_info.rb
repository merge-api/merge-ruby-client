# frozen_string_literal: true

require "date"
require_relative "bank_info_employee"
require_relative "account_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The BankInfo Object
    #  ### Description
    #  The `BankInfo` object is used to represent the Bank Account information for an
    #  Employee.
    #  ### Usage Example
    #  Fetch from the `LIST BankInfo` endpoint and filter by `ID` to show all bank
    #  information.
    class BankInfo
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [Merge::Hris::BankInfoEmployee] The employee with this bank account.
      attr_reader :employee
      # @return [String] The account number.
      attr_reader :account_number
      # @return [String] The routing number.
      attr_reader :routing_number
      # @return [String] The bank name.
      attr_reader :bank_name
      # @return [Merge::Hris::AccountTypeEnum] The bank account type
      #  - `SAVINGS` - SAVINGS
      #  - `CHECKING` - CHECKING
      attr_reader :account_type
      # @return [DateTime] When the matching bank object was created in the third party system.
      attr_reader :remote_created_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Hris::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param employee [Merge::Hris::BankInfoEmployee] The employee with this bank account.
      # @param account_number [String] The account number.
      # @param routing_number [String] The routing number.
      # @param bank_name [String] The bank name.
      # @param account_type [Merge::Hris::AccountTypeEnum] The bank account type
      #  - `SAVINGS` - SAVINGS
      #  - `CHECKING` - CHECKING
      # @param remote_created_at [DateTime] When the matching bank object was created in the third party system.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::BankInfo]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee: OMIT,
                     account_number: OMIT, routing_number: OMIT, bank_name: OMIT, account_type: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee = employee if employee != OMIT
        @account_number = account_number if account_number != OMIT
        @routing_number = routing_number if routing_number != OMIT
        @bank_name = bank_name if bank_name != OMIT
        @account_type = account_type if account_type != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "employee": employee,
          "account_number": account_number,
          "routing_number": routing_number,
          "bank_name": bank_name,
          "account_type": account_type,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of BankInfo
      #
      # @param json_object [String]
      # @return [Merge::Hris::BankInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Hris::BankInfoEmployee.from_json(json_object: employee)
        end
        account_number = struct["account_number"]
        routing_number = struct["routing_number"]
        bank_name = struct["bank_name"]
        account_type = struct["account_type"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Hris::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          employee: employee,
          account_number: account_number,
          routing_number: routing_number,
          bank_name: bank_name,
          account_type: account_type,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of BankInfo to a JSON object
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
        obj.employee.nil? || Merge::Hris::BankInfoEmployee.validate_raw(obj: obj.employee)
        obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
        obj.routing_number&.is_a?(String) != false || raise("Passed value for field obj.routing_number is not the expected type, validation failed.")
        obj.bank_name&.is_a?(String) != false || raise("Passed value for field obj.bank_name is not the expected type, validation failed.")
        obj.account_type&.is_a?(Merge::Hris::AccountTypeEnum) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
