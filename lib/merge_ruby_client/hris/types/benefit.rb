# frozen_string_literal: true

require "date"
require_relative "benefit_employee"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Benefit Object
    #  ### Description
    #  The `Benefit` object is used to represent a benefit that an employee has
    #  enrolled in.
    #  ### Usage Example
    #  Fetch from the `LIST Benefits` endpoint and filter by `ID` to show all benefits.
    class Benefit
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::BenefitEmployee] The employee on the plan.
      attr_reader :employee
      # @return [String] The name of the benefit provider.
      attr_reader :provider_name
      # @return [String] The type of benefit plan
      attr_reader :benefit_plan_type
      # @return [Float] The employee's contribution.
      attr_reader :employee_contribution
      # @return [Float] The company's contribution.
      attr_reader :company_contribution
      # @return [DateTime] The day and time the benefit started.
      attr_reader :start_date
      # @return [DateTime] The day and time the benefit ended.
      attr_reader :end_date
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [String] The employer benefit plan the employee is enrolled in.
      attr_reader :employer_benefit
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
      # @param employee [Merge::Hris::BenefitEmployee] The employee on the plan.
      # @param provider_name [String] The name of the benefit provider.
      # @param benefit_plan_type [String] The type of benefit plan
      # @param employee_contribution [Float] The employee's contribution.
      # @param company_contribution [Float] The company's contribution.
      # @param start_date [DateTime] The day and time the benefit started.
      # @param end_date [DateTime] The day and time the benefit ended.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param employer_benefit [String] The employer benefit plan the employee is enrolled in.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::Benefit]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee: OMIT,
                     provider_name: OMIT, benefit_plan_type: OMIT, employee_contribution: OMIT, company_contribution: OMIT, start_date: OMIT, end_date: OMIT, remote_was_deleted: OMIT, employer_benefit: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee = employee if employee != OMIT
        @provider_name = provider_name if provider_name != OMIT
        @benefit_plan_type = benefit_plan_type if benefit_plan_type != OMIT
        @employee_contribution = employee_contribution if employee_contribution != OMIT
        @company_contribution = company_contribution if company_contribution != OMIT
        @start_date = start_date if start_date != OMIT
        @end_date = end_date if end_date != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @employer_benefit = employer_benefit if employer_benefit != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "employee": employee,
          "provider_name": provider_name,
          "benefit_plan_type": benefit_plan_type,
          "employee_contribution": employee_contribution,
          "company_contribution": company_contribution,
          "start_date": start_date,
          "end_date": end_date,
          "remote_was_deleted": remote_was_deleted,
          "employer_benefit": employer_benefit,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Benefit
      #
      # @param json_object [String]
      # @return [Merge::Hris::Benefit]
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
          employee = Merge::Hris::BenefitEmployee.from_json(json_object: employee)
        end
        provider_name = parsed_json["provider_name"]
        benefit_plan_type = parsed_json["benefit_plan_type"]
        employee_contribution = parsed_json["employee_contribution"]
        company_contribution = parsed_json["company_contribution"]
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        remote_was_deleted = parsed_json["remote_was_deleted"]
        employer_benefit = parsed_json["employer_benefit"]
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
          provider_name: provider_name,
          benefit_plan_type: benefit_plan_type,
          employee_contribution: employee_contribution,
          company_contribution: company_contribution,
          start_date: start_date,
          end_date: end_date,
          remote_was_deleted: remote_was_deleted,
          employer_benefit: employer_benefit,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Benefit to a JSON object
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
        obj.employee.nil? || Merge::Hris::BenefitEmployee.validate_raw(obj: obj.employee)
        obj.provider_name&.is_a?(String) != false || raise("Passed value for field obj.provider_name is not the expected type, validation failed.")
        obj.benefit_plan_type&.is_a?(String) != false || raise("Passed value for field obj.benefit_plan_type is not the expected type, validation failed.")
        obj.employee_contribution&.is_a?(Float) != false || raise("Passed value for field obj.employee_contribution is not the expected type, validation failed.")
        obj.company_contribution&.is_a?(Float) != false || raise("Passed value for field obj.company_contribution is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.employer_benefit&.is_a?(String) != false || raise("Passed value for field obj.employer_benefit is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
