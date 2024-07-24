# frozen_string_literal: true

require "date"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Deduction Object
    #  ### Description
    #  The `Deduction` object is used to represent an array of the wages withheld from
    #  total earnings for the purpose of paying taxes.
    #  ### Usage Example
    #  Fetch from the `LIST Deductions` endpoint and filter by `ID` to show all
    #  deductions.
    class Deduction
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String]
      attr_reader :employee_payroll_run
      # @return [String] The deduction's name.
      attr_reader :name
      # @return [Float] The amount of money that is withheld from an employee's gross pay by the
      #  employee.
      attr_reader :employee_deduction
      # @return [Float] The amount of money that is withheld on behalf of an employee by the company.
      attr_reader :company_deduction
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
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param employee_payroll_run [String]
      # @param name [String] The deduction's name.
      # @param employee_deduction [Float] The amount of money that is withheld from an employee's gross pay by the
      #  employee.
      # @param company_deduction [Float] The amount of money that is withheld on behalf of an employee by the company.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::Deduction]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee_payroll_run: OMIT,
                     name: OMIT, employee_deduction: OMIT, company_deduction: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee_payroll_run = employee_payroll_run if employee_payroll_run != OMIT
        @name = name if name != OMIT
        @employee_deduction = employee_deduction if employee_deduction != OMIT
        @company_deduction = company_deduction if company_deduction != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "employee_payroll_run": employee_payroll_run,
          "name": name,
          "employee_deduction": employee_deduction,
          "company_deduction": company_deduction,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Deduction
      #
      # @param json_object [String]
      # @return [Merge::Hris::Deduction]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        employee_payroll_run = parsed_json["employee_payroll_run"]
        name = parsed_json["name"]
        employee_deduction = parsed_json["employee_deduction"]
        company_deduction = parsed_json["company_deduction"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Hris::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          employee_payroll_run: employee_payroll_run,
          name: name,
          employee_deduction: employee_deduction,
          company_deduction: company_deduction,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Deduction to a JSON object
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
        obj.employee_payroll_run&.is_a?(String) != false || raise("Passed value for field obj.employee_payroll_run is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.employee_deduction&.is_a?(Float) != false || raise("Passed value for field obj.employee_deduction is not the expected type, validation failed.")
        obj.company_deduction&.is_a?(Float) != false || raise("Passed value for field obj.company_deduction is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
