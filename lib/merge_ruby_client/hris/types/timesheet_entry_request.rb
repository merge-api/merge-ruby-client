# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Timesheet Entry Object
    #  ### Description
    #  The `Timesheet Entry` object is used to track coverage for hours worked by an
    #  'Employee'.
    #  ### Usage Example
    #  GET and POST Timesheet Entries
    class TimesheetEntryRequest
      # @return [String] The employee the timesheet entry is for.
      attr_reader :employee
      # @return [Float] The number of hours logged by the employee.
      attr_reader :hours_worked
      # @return [DateTime] The time at which the employee started work.
      attr_reader :start_time
      # @return [DateTime] The time at which the employee ended work.
      attr_reader :end_time
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param employee [String] The employee the timesheet entry is for.
      # @param hours_worked [Float] The number of hours logged by the employee.
      # @param start_time [DateTime] The time at which the employee started work.
      # @param end_time [DateTime] The time at which the employee ended work.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::TimesheetEntryRequest]
      def initialize(employee: OMIT, hours_worked: OMIT, start_time: OMIT, end_time: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @employee = employee if employee != OMIT
        @hours_worked = hours_worked if hours_worked != OMIT
        @start_time = start_time if start_time != OMIT
        @end_time = end_time if end_time != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "employee": employee,
          "hours_worked": hours_worked,
          "start_time": start_time,
          "end_time": end_time,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TimesheetEntryRequest
      #
      # @param json_object [String]
      # @return [Merge::Hris::TimesheetEntryRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        employee = struct["employee"]
        hours_worked = struct["hours_worked"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          employee: employee,
          hours_worked: hours_worked,
          start_time: start_time,
          end_time: end_time,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of TimesheetEntryRequest to a JSON object
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
        obj.employee&.is_a?(String) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.hours_worked&.is_a?(Float) != false || raise("Passed value for field obj.hours_worked is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
