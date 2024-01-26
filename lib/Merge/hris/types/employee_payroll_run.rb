# frozen_string_literal: true
require_relative "employee_payroll_run_employee"
require_relative "employee_payroll_run_payroll_run"
require "date"
require "date"
require "date"
require_relative "earning"
require_relative "deduction"
require_relative "tax"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The EmployeePayrollRun Object 
### Description

The `EmployeePayrollRun` object is used to represent an employee's pay statement for a specific payroll run.

### Usage Example

Fetch from the `LIST EmployeePayrollRun` endpoint and filter by `ID` to show all employee payroll runs.
    class EmployeePayrollRun
      attr_reader :id, :remote_id, :employee, :payroll_run, :gross_pay, :net_pay, :start_date, :end_date, :check_date, :earnings, :deductions, :taxes, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [Hris::EmployeePayrollRunEmployee] The employee whose payroll is being run.
      # @param payroll_run [Hris::EmployeePayrollRunPayrollRun] The payroll being run.
      # @param gross_pay [Float] The total earnings throughout a given period for an employee before any deductions are made.
      # @param net_pay [Float] The take-home pay throughout a given period for an employee after deductions are made.
      # @param start_date [DateTime] The day and time the payroll run started.
      # @param end_date [DateTime] The day and time the payroll run ended.
      # @param check_date [DateTime] The day and time the payroll run was checked.
      # @param earnings [Array<Hris::Earning>] 
      # @param deductions [Array<Hris::Deduction>] 
      # @param taxes [Array<Hris::Tax>] 
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Hris::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::EmployeePayrollRun]
      def initialize(id: nil, remote_id: nil, employee: nil, payroll_run: nil, gross_pay: nil, net_pay: nil, start_date: nil, end_date: nil, check_date: nil, earnings: nil, deductions: nil, taxes: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::EmployeePayrollRunEmployee] The employee whose payroll is being run.
        @employee = employee
        # @type [Hris::EmployeePayrollRunPayrollRun] The payroll being run.
        @payroll_run = payroll_run
        # @type [Float] The total earnings throughout a given period for an employee before any deductions are made.
        @gross_pay = gross_pay
        # @type [Float] The take-home pay throughout a given period for an employee after deductions are made.
        @net_pay = net_pay
        # @type [DateTime] The day and time the payroll run started.
        @start_date = start_date
        # @type [DateTime] The day and time the payroll run ended.
        @end_date = end_date
        # @type [DateTime] The day and time the payroll run was checked.
        @check_date = check_date
        # @type [Array<Hris::Earning>] 
        @earnings = earnings
        # @type [Array<Hris::Deduction>] 
        @deductions = deductions
        # @type [Array<Hris::Tax>] 
        @taxes = taxes
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
      # Deserialize a JSON object to an instance of EmployeePayrollRun
      #
      # @param json_object [JSON] 
      # @return [Hris::EmployeePayrollRun]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        employee = struct.employee.to_h.to_json()
        employee = Hris::EmployeePayrollRunEmployee.from_json(json_object: employee)
        payroll_run = struct.payroll_run.to_h.to_json()
        payroll_run = Hris::EmployeePayrollRunPayrollRun.from_json(json_object: payroll_run)
        gross_pay = struct.gross_pay
        net_pay = struct.net_pay
        start_date = DateTime.parse(struct.start_date)
        end_date = DateTime.parse(struct.end_date)
        check_date = DateTime.parse(struct.check_date)
        earnings = struct.earnings.map() do | v |
  v = v.to_h.to_json()
  Hris::Earning.from_json(json_object: v)
end
        deductions = struct.deductions.map() do | v |
  v = v.to_h.to_json()
  Hris::Deduction.from_json(json_object: v)
end
        taxes = struct.taxes.map() do | v |
  v = v.to_h.to_json()
  Hris::Tax.from_json(json_object: v)
end
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Hris::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, employee: employee, payroll_run: payroll_run, gross_pay: gross_pay, net_pay: net_pay, start_date: start_date, end_date: end_date, check_date: check_date, earnings: earnings, deductions: deductions, taxes: taxes, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of EmployeePayrollRun to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "employee": @employee, "payroll_run": @payroll_run, "gross_pay": @gross_pay, "net_pay": @net_pay, "start_date": @start_date, "end_date": @end_date, "check_date": @check_date, "earnings": @earnings, "deductions": @deductions, "taxes": @taxes, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.employee.nil?() || Hris::EmployeePayrollRunEmployee.validate_raw(obj: obj.employee)
        obj.payroll_run.nil?() || Hris::EmployeePayrollRunPayrollRun.validate_raw(obj: obj.payroll_run)
        obj.gross_pay&.is_a?(Float) != false || raise("Passed value for field obj.gross_pay is not the expected type, validation failed.")
        obj.net_pay&.is_a?(Float) != false || raise("Passed value for field obj.net_pay is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.check_date&.is_a?(DateTime) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
        obj.earnings&.is_a?(Array) != false || raise("Passed value for field obj.earnings is not the expected type, validation failed.")
        obj.deductions&.is_a?(Array) != false || raise("Passed value for field obj.deductions is not the expected type, validation failed.")
        obj.taxes&.is_a?(Array) != false || raise("Passed value for field obj.taxes is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end