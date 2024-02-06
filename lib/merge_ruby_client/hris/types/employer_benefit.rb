# frozen_string_literal: true

require_relative "employer_benefit_benefit_plan_type"
require "date"
require "json"

module Merge
  module Hris
    # # The EmployerBenefit Object
    #
    # ### Description
    #
    # The `Employer Benefit` object is used to represent a benefit plan offered by a company.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST EmployerBenefits` endpoint and filter by `ID` to show all EmployerBenefits.
    class EmployerBenefit
      attr_reader :id, :remote_id, :benefit_plan_type, :name, :description, :deduction_code, :remote_was_deleted,
                  :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param benefit_plan_type [Hris::EmployerBenefitBenefitPlanType] The type of benefit plan.
      #   - `MEDICAL` - MEDICAL
      #   - `HEALTH_SAVINGS` - HEALTH_SAVINGS
      #   - `INSURANCE` - INSURANCE
      #   - `RETIREMENT` - RETIREMENT
      #   - `OTHER` - OTHER
      # @param name [String] The employer benefit's name - typically the carrier or network name.
      # @param description [String] The employer benefit's description.
      # @param deduction_code [String] The employer benefit's deduction code.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hash>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::EmployerBenefit]
      def initialize(id: nil, remote_id: nil, benefit_plan_type: nil, name: nil, description: nil, deduction_code: nil,
                     remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::EmployerBenefitBenefitPlanType] The type of benefit plan.
        #   - `MEDICAL` - MEDICAL
        #   - `HEALTH_SAVINGS` - HEALTH_SAVINGS
        #   - `INSURANCE` - INSURANCE
        #   - `RETIREMENT` - RETIREMENT
        #   - `OTHER` - OTHER
        @benefit_plan_type = benefit_plan_type
        # @type [String] The employer benefit's name - typically the carrier or network name.
        @name = name
        # @type [String] The employer benefit's description.
        @description = description
        # @type [String] The employer benefit's deduction code.
        @deduction_code = deduction_code
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hash>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmployerBenefit
      #
      # @param json_object [JSON]
      # @return [Hris::EmployerBenefit]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["benefit_plan_type"].nil?
          benefit_plan_type = nil
        else
          benefit_plan_type = parsed_json["benefit_plan_type"].to_json
          benefit_plan_type = Hris::EmployerBenefitBenefitPlanType.from_json(json_object: benefit_plan_type)
        end
        name = struct.name
        description = struct.description
        deduction_code = struct.deduction_code
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data
        new(id: id, remote_id: remote_id, benefit_plan_type: benefit_plan_type, name: name, description: description,
            deduction_code: deduction_code, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of EmployerBenefit to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "benefit_plan_type": @benefit_plan_type,
          "name": @name,
          "description": @description,
          "deduction_code": @deduction_code,
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
        obj.benefit_plan_type.nil? || Hris::EmployerBenefitBenefitPlanType.validate_raw(obj: obj.benefit_plan_type)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.deduction_code&.is_a?(String) != false || raise("Passed value for field obj.deduction_code is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
