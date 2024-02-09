# frozen_string_literal: true

require_relative "benefit_employee"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Benefit Object
    #
    # ### Description
    #
    # The `Benefit` object is used to represent a benefit that an employee has enrolled in.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Benefits` endpoint and filter by `ID` to show all benefits.
    class Benefit
      attr_reader :id, :remote_id, :employee, :provider_name, :benefit_plan_type, :employee_contribution,
                  :company_contribution, :start_date, :end_date, :remote_was_deleted, :employer_benefit, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [Hris::BenefitEmployee] The employee on the plan.
      # @param provider_name [String] The name of the benefit provider.
      # @param benefit_plan_type [String] The type of benefit plan
      # @param employee_contribution [Float] The employee's contribution.
      # @param company_contribution [Float] The company's contribution.
      # @param start_date [DateTime] The day and time the benefit started.
      # @param end_date [DateTime] The day and time the benefit ended.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param employer_benefit [String] The employer benefit plan the employee is enrolled in.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Benefit]
      def initialize(id: nil, remote_id: nil, employee: nil, provider_name: nil, benefit_plan_type: nil,
                     employee_contribution: nil, company_contribution: nil, start_date: nil, end_date: nil, remote_was_deleted: nil, employer_benefit: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::BenefitEmployee] The employee on the plan.
        @employee = employee
        # @type [String] The name of the benefit provider.
        @provider_name = provider_name
        # @type [String] The type of benefit plan
        @benefit_plan_type = benefit_plan_type
        # @type [Float] The employee's contribution.
        @employee_contribution = employee_contribution
        # @type [Float] The company's contribution.
        @company_contribution = company_contribution
        # @type [DateTime] The day and time the benefit started.
        @start_date = start_date
        # @type [DateTime] The day and time the benefit ended.
        @end_date = end_date
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [String] The employer benefit plan the employee is enrolled in.
        @employer_benefit = employer_benefit
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

      # Deserialize a JSON object to an instance of Benefit
      #
      # @param json_object [JSON]
      # @return [Hris::Benefit]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Hris::BenefitEmployee.from_json(json_object: employee)
        end
        provider_name = struct.provider_name
        benefit_plan_type = struct.benefit_plan_type
        employee_contribution = struct.employee_contribution
        company_contribution = struct.company_contribution
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        remote_was_deleted = struct.remote_was_deleted
        employer_benefit = struct.employer_benefit
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, employee: employee, provider_name: provider_name,
            benefit_plan_type: benefit_plan_type, employee_contribution: employee_contribution, company_contribution: company_contribution, start_date: start_date, end_date: end_date, remote_was_deleted: remote_was_deleted, employer_benefit: employer_benefit, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Benefit to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee": @employee,
          "provider_name": @provider_name,
          "benefit_plan_type": @benefit_plan_type,
          "employee_contribution": @employee_contribution,
          "company_contribution": @company_contribution,
          "start_date": @start_date,
          "end_date": @end_date,
          "remote_was_deleted": @remote_was_deleted,
          "employer_benefit": @employer_benefit,
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
        obj.employee.nil? || Hris::BenefitEmployee.validate_raw(obj: obj.employee)
        obj.provider_name&.is_a?(String) != false || raise("Passed value for field obj.provider_name is not the expected type, validation failed.")
        obj.benefit_plan_type&.is_a?(String) != false || raise("Passed value for field obj.benefit_plan_type is not the expected type, validation failed.")
        obj.employee_contribution&.is_a?(Float) != false || raise("Passed value for field obj.employee_contribution is not the expected type, validation failed.")
        obj.company_contribution&.is_a?(Float) != false || raise("Passed value for field obj.company_contribution is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.employer_benefit&.is_a?(String) != false || raise("Passed value for field obj.employer_benefit is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
