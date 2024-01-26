# frozen_string_literal: true
require "date"
require "date"
require "json"

module Merge
  module Hris
    # # The Timesheet Entry Object 
### Description

The `Timesheet Entry` object is used to track coverage for hours worked by an 'Employee'.

### Usage Example

GET and POST Timesheet Entries
    class TimesheetEntryRequest
      attr_reader :employee, :hours_worked, :start_time, :end_time, :integration_params, :linked_account_params, :additional_properties
      # @param employee [String] The employee the timesheet entry is for.
      # @param hours_worked [Float] The number of hours logged by the employee.
      # @param start_time [DateTime] The time at which the employee started work.
      # @param end_time [DateTime] The time at which the employee ended work.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::TimesheetEntryRequest]
      def initialize(employee: nil, hours_worked: nil, start_time: nil, end_time: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The employee the timesheet entry is for.
        @employee = employee
        # @type [Float] The number of hours logged by the employee.
        @hours_worked = hours_worked
        # @type [DateTime] The time at which the employee started work.
        @start_time = start_time
        # @type [DateTime] The time at which the employee ended work.
        @end_time = end_time
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of TimesheetEntryRequest
      #
      # @param json_object [JSON] 
      # @return [Hris::TimesheetEntryRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        employee = struct.employee
        hours_worked = struct.hours_worked
        start_time = DateTime.parse(struct.start_time)
        end_time = DateTime.parse(struct.end_time)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(employee: employee, hours_worked: hours_worked, start_time: start_time, end_time: end_time, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of TimesheetEntryRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "employee": @employee, "hours_worked": @hours_worked, "start_time": @start_time, "end_time": @end_time, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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