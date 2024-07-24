# frozen_string_literal: true

require "date"
require_relative "employee_payroll_run_employee"
require_relative "employee_payroll_run_payroll_run"
require_relative "earning"
require_relative "deduction"
require_relative "tax"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The EmployeePayrollRun Object
    #  ### Description
    #  The `EmployeePayrollRun` object is used to represent an employee's pay statement
    #  for a specific payroll run.
    #  ### Usage Example
    #  Fetch from the `LIST EmployeePayrollRun` endpoint and filter by `ID` to show all
    #  employee payroll runs.
    class EmployeePayrollRun
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::EmployeePayrollRunEmployee] The employee whose payroll is being run.
      attr_reader :employee
      # @return [Merge::Hris::EmployeePayrollRunPayrollRun] The payroll being run.
      attr_reader :payroll_run
      # @return [Float] The total earnings throughout a given period for an employee before any
      #  deductions are made.
      attr_reader :gross_pay
      # @return [Float] The take-home pay throughout a given period for an employee after deductions are
      #  made.
      attr_reader :net_pay
      # @return [DateTime] The day and time the payroll run started.
      attr_reader :start_date
      # @return [DateTime] The day and time the payroll run ended.
      attr_reader :end_date
      # @return [DateTime] The day and time the payroll run was checked.
      attr_reader :check_date
      # @return [Array<Merge::Hris::Earning>]
      attr_reader :earnings
      # @return [Array<Merge::Hris::Deduction>]
      attr_reader :deductions
      # @return [Array<Merge::Hris::Tax>]
      attr_reader :taxes
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
      # @param employee [Merge::Hris::EmployeePayrollRunEmployee] The employee whose payroll is being run.
      # @param payroll_run [Merge::Hris::EmployeePayrollRunPayrollRun] The payroll being run.
      # @param gross_pay [Float] The total earnings throughout a given period for an employee before any
      #  deductions are made.
      # @param net_pay [Float] The take-home pay throughout a given period for an employee after deductions are
      #  made.
      # @param start_date [DateTime] The day and time the payroll run started.
      # @param end_date [DateTime] The day and time the payroll run ended.
      # @param check_date [DateTime] The day and time the payroll run was checked.
      # @param earnings [Array<Merge::Hris::Earning>]
      # @param deductions [Array<Merge::Hris::Deduction>]
      # @param taxes [Array<Merge::Hris::Tax>]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::EmployeePayrollRun]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee: OMIT, payroll_run: OMIT,
                     gross_pay: OMIT, net_pay: OMIT, start_date: OMIT, end_date: OMIT, check_date: OMIT, earnings: OMIT, deductions: OMIT, taxes: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee = employee if employee != OMIT
        @payroll_run = payroll_run if payroll_run != OMIT
        @gross_pay = gross_pay if gross_pay != OMIT
        @net_pay = net_pay if net_pay != OMIT
        @start_date = start_date if start_date != OMIT
        @end_date = end_date if end_date != OMIT
        @check_date = check_date if check_date != OMIT
        @earnings = earnings if earnings != OMIT
        @deductions = deductions if deductions != OMIT
        @taxes = taxes if taxes != OMIT
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
          "payroll_run": payroll_run,
          "gross_pay": gross_pay,
          "net_pay": net_pay,
          "start_date": start_date,
          "end_date": end_date,
          "check_date": check_date,
          "earnings": earnings,
          "deductions": deductions,
          "taxes": taxes,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmployeePayrollRun
      #
      # @param json_object [String]
      # @return [Merge::Hris::EmployeePayrollRun]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Hris::EmployeePayrollRunEmployee.from_json(json_object: employee)
        end
        if parsed_json["payroll_run"].nil?
          payroll_run = nil
        else
          payroll_run = parsed_json["payroll_run"].to_json
          payroll_run = Merge::Hris::EmployeePayrollRunPayrollRun.from_json(json_object: payroll_run)
        end
        gross_pay = parsed_json["gross_pay"]
        net_pay = parsed_json["net_pay"]
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        check_date = (DateTime.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
        earnings = parsed_json["earnings"]&.map do |item|
          item = item.to_json
          Merge::Hris::Earning.from_json(json_object: item)
        end
        deductions = parsed_json["deductions"]&.map do |item|
          item = item.to_json
          Merge::Hris::Deduction.from_json(json_object: item)
        end
        taxes = parsed_json["taxes"]&.map do |item|
          item = item.to_json
          Merge::Hris::Tax.from_json(json_object: item)
        end
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
          employee: employee,
          payroll_run: payroll_run,
          gross_pay: gross_pay,
          net_pay: net_pay,
          start_date: start_date,
          end_date: end_date,
          check_date: check_date,
          earnings: earnings,
          deductions: deductions,
          taxes: taxes,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of EmployeePayrollRun to a JSON object
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
        obj.employee.nil? || Merge::Hris::EmployeePayrollRunEmployee.validate_raw(obj: obj.employee)
        obj.payroll_run.nil? || Merge::Hris::EmployeePayrollRunPayrollRun.validate_raw(obj: obj.payroll_run)
        obj.gross_pay&.is_a?(Float) != false || raise("Passed value for field obj.gross_pay is not the expected type, validation failed.")
        obj.net_pay&.is_a?(Float) != false || raise("Passed value for field obj.net_pay is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.check_date&.is_a?(DateTime) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
        obj.earnings&.is_a?(Array) != false || raise("Passed value for field obj.earnings is not the expected type, validation failed.")
        obj.deductions&.is_a?(Array) != false || raise("Passed value for field obj.deductions is not the expected type, validation failed.")
        obj.taxes&.is_a?(Array) != false || raise("Passed value for field obj.taxes is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
