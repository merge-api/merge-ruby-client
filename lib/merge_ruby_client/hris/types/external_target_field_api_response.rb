# frozen_string_literal: true

require_relative "external_target_field_api"
require "ostruct"
require "json"

module Merge
  module Hris
    class ExternalTargetFieldApiResponse
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :benefit
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :employer_benefit
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :company
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :employee_payroll_run
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :employee
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :employment
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :location
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :payroll_run
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :team
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :time_off
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :time_off_balance
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :bank_info
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :pay_group
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :group
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :dependent
      # @return [Array<Merge::Hris::ExternalTargetFieldApi>]
      attr_reader :timesheet_entry
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param benefit [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param employer_benefit [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param company [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param employee_payroll_run [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param employee [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param employment [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param location [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param payroll_run [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param team [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param time_off [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param time_off_balance [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param bank_info [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param pay_group [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param group [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param dependent [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param timesheet_entry [Array<Merge::Hris::ExternalTargetFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::ExternalTargetFieldApiResponse]
      def initialize(benefit: OMIT, employer_benefit: OMIT, company: OMIT, employee_payroll_run: OMIT, employee: OMIT,
                     employment: OMIT, location: OMIT, payroll_run: OMIT, team: OMIT, time_off: OMIT, time_off_balance: OMIT, bank_info: OMIT, pay_group: OMIT, group: OMIT, dependent: OMIT, timesheet_entry: OMIT, additional_properties: nil)
        @benefit = benefit if benefit != OMIT
        @employer_benefit = employer_benefit if employer_benefit != OMIT
        @company = company if company != OMIT
        @employee_payroll_run = employee_payroll_run if employee_payroll_run != OMIT
        @employee = employee if employee != OMIT
        @employment = employment if employment != OMIT
        @location = location if location != OMIT
        @payroll_run = payroll_run if payroll_run != OMIT
        @team = team if team != OMIT
        @time_off = time_off if time_off != OMIT
        @time_off_balance = time_off_balance if time_off_balance != OMIT
        @bank_info = bank_info if bank_info != OMIT
        @pay_group = pay_group if pay_group != OMIT
        @group = group if group != OMIT
        @dependent = dependent if dependent != OMIT
        @timesheet_entry = timesheet_entry if timesheet_entry != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "Benefit": benefit,
          "EmployerBenefit": employer_benefit,
          "Company": company,
          "EmployeePayrollRun": employee_payroll_run,
          "Employee": employee,
          "Employment": employment,
          "Location": location,
          "PayrollRun": payroll_run,
          "Team": team,
          "TimeOff": time_off,
          "TimeOffBalance": time_off_balance,
          "BankInfo": bank_info,
          "PayGroup": pay_group,
          "Group": group,
          "Dependent": dependent,
          "TimesheetEntry": timesheet_entry
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExternalTargetFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Hris::ExternalTargetFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        benefit = parsed_json["Benefit"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        employer_benefit = parsed_json["EmployerBenefit"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        company = parsed_json["Company"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        employee_payroll_run = parsed_json["EmployeePayrollRun"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        employee = parsed_json["Employee"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        employment = parsed_json["Employment"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        location = parsed_json["Location"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        payroll_run = parsed_json["PayrollRun"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        team = parsed_json["Team"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        time_off = parsed_json["TimeOff"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        time_off_balance = parsed_json["TimeOffBalance"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        bank_info = parsed_json["BankInfo"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        pay_group = parsed_json["PayGroup"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        group = parsed_json["Group"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        dependent = parsed_json["Dependent"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        timesheet_entry = parsed_json["TimesheetEntry"]&.map do |v|
          v = v.to_json
          Merge::Hris::ExternalTargetFieldApi.from_json(json_object: v)
        end
        new(
          benefit: benefit,
          employer_benefit: employer_benefit,
          company: company,
          employee_payroll_run: employee_payroll_run,
          employee: employee,
          employment: employment,
          location: location,
          payroll_run: payroll_run,
          team: team,
          time_off: time_off,
          time_off_balance: time_off_balance,
          bank_info: bank_info,
          pay_group: pay_group,
          group: group,
          dependent: dependent,
          timesheet_entry: timesheet_entry,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExternalTargetFieldApiResponse to a JSON object
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
        obj.benefit&.is_a?(Array) != false || raise("Passed value for field obj.benefit is not the expected type, validation failed.")
        obj.employer_benefit&.is_a?(Array) != false || raise("Passed value for field obj.employer_benefit is not the expected type, validation failed.")
        obj.company&.is_a?(Array) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.employee_payroll_run&.is_a?(Array) != false || raise("Passed value for field obj.employee_payroll_run is not the expected type, validation failed.")
        obj.employee&.is_a?(Array) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.employment&.is_a?(Array) != false || raise("Passed value for field obj.employment is not the expected type, validation failed.")
        obj.location&.is_a?(Array) != false || raise("Passed value for field obj.location is not the expected type, validation failed.")
        obj.payroll_run&.is_a?(Array) != false || raise("Passed value for field obj.payroll_run is not the expected type, validation failed.")
        obj.team&.is_a?(Array) != false || raise("Passed value for field obj.team is not the expected type, validation failed.")
        obj.time_off&.is_a?(Array) != false || raise("Passed value for field obj.time_off is not the expected type, validation failed.")
        obj.time_off_balance&.is_a?(Array) != false || raise("Passed value for field obj.time_off_balance is not the expected type, validation failed.")
        obj.bank_info&.is_a?(Array) != false || raise("Passed value for field obj.bank_info is not the expected type, validation failed.")
        obj.pay_group&.is_a?(Array) != false || raise("Passed value for field obj.pay_group is not the expected type, validation failed.")
        obj.group&.is_a?(Array) != false || raise("Passed value for field obj.group is not the expected type, validation failed.")
        obj.dependent&.is_a?(Array) != false || raise("Passed value for field obj.dependent is not the expected type, validation failed.")
        obj.timesheet_entry&.is_a?(Array) != false || raise("Passed value for field obj.timesheet_entry is not the expected type, validation failed.")
      end
    end
  end
end
