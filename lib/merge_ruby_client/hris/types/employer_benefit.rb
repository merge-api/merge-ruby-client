# frozen_string_literal: true

require "date"
require_relative "benefit_plan_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The EmployerBenefit Object
    #  ### Description
    #  The `Employer Benefit` object is used to represent a benefit plan offered by a
    #  company.
    #  ### Usage Example
    #  Fetch from the `LIST EmployerBenefits` endpoint and filter by `ID` to show all
    #  EmployerBenefits.
    class EmployerBenefit
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::BenefitPlanTypeEnum] The type of benefit plan.
      #  - `MEDICAL` - MEDICAL
      #  - `HEALTH_SAVINGS` - HEALTH_SAVINGS
      #  - `INSURANCE` - INSURANCE
      #  - `RETIREMENT` - RETIREMENT
      #  - `OTHER` - OTHER
      attr_reader :benefit_plan_type
      # @return [String] The employer benefit's name - typically the carrier or network name.
      attr_reader :name
      # @return [String] The employer benefit's description.
      attr_reader :description
      # @return [String] The employer benefit's deduction code.
      attr_reader :deduction_code
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
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
      # @param benefit_plan_type [Merge::Hris::BenefitPlanTypeEnum] The type of benefit plan.
      #  - `MEDICAL` - MEDICAL
      #  - `HEALTH_SAVINGS` - HEALTH_SAVINGS
      #  - `INSURANCE` - INSURANCE
      #  - `RETIREMENT` - RETIREMENT
      #  - `OTHER` - OTHER
      # @param name [String] The employer benefit's name - typically the carrier or network name.
      # @param description [String] The employer benefit's description.
      # @param deduction_code [String] The employer benefit's deduction code.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::EmployerBenefit]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, benefit_plan_type: OMIT,
                     name: OMIT, description: OMIT, deduction_code: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @benefit_plan_type = benefit_plan_type if benefit_plan_type != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @deduction_code = deduction_code if deduction_code != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "benefit_plan_type": benefit_plan_type,
          "name": name,
          "description": description,
          "deduction_code": deduction_code,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmployerBenefit
      #
      # @param json_object [String]
      # @return [Merge::Hris::EmployerBenefit]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        benefit_plan_type = parsed_json["benefit_plan_type"]
        name = parsed_json["name"]
        description = parsed_json["description"]
        deduction_code = parsed_json["deduction_code"]
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
          benefit_plan_type: benefit_plan_type,
          name: name,
          description: description,
          deduction_code: deduction_code,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of EmployerBenefit to a JSON object
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
        obj.benefit_plan_type&.is_a?(Merge::Hris::BenefitPlanTypeEnum) != false || raise("Passed value for field obj.benefit_plan_type is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.deduction_code&.is_a?(String) != false || raise("Passed value for field obj.deduction_code is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
