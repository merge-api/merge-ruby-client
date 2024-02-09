# frozen_string_literal: true

require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Tax Object
    #
    # ### Description
    #
    # The `Tax` object is used to represent an array of the tax deductions for a given employee's payroll run.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Taxes` endpoint and filter by `ID` to show all taxes.
    class Tax
      attr_reader :id, :remote_id, :employee_payroll_run, :name, :amount, :employer_tax, :remote_was_deleted,
                  :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee_payroll_run [String]
      # @param name [String] The tax's name.
      # @param amount [Float] The tax amount.
      # @param employer_tax [Boolean] Whether or not the employer is responsible for paying the tax.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Tax]
      def initialize(id: nil, remote_id: nil, employee_payroll_run: nil, name: nil, amount: nil, employer_tax: nil,
                     remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String]
        @employee_payroll_run = employee_payroll_run
        # @type [String] The tax's name.
        @name = name
        # @type [Float] The tax amount.
        @amount = amount
        # @type [Boolean] Whether or not the employer is responsible for paying the tax.
        @employer_tax = employer_tax
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

      # Deserialize a JSON object to an instance of Tax
      #
      # @param json_object [JSON]
      # @return [Hris::Tax]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        employee_payroll_run = struct.employee_payroll_run
        name = struct.name
        amount = struct.amount
        employer_tax = struct.employer_tax
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, employee_payroll_run: employee_payroll_run, name: name, amount: amount,
            employer_tax: employer_tax, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Tax to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee_payroll_run": @employee_payroll_run,
          "name": @name,
          "amount": @amount,
          "employer_tax": @employer_tax,
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
        obj.employee_payroll_run&.is_a?(String) != false || raise("Passed value for field obj.employee_payroll_run is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.employer_tax&.is_a?(Boolean) != false || raise("Passed value for field obj.employer_tax is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
