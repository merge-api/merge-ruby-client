# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Hris
    # # The Timesheet Entry Object
    #
    # ### Description
    #
    # The `Timesheet Entry` object is used to track coverage for hours worked by an 'Employee'.
    #
    # ### Usage Example
    #
    # GET and POST Timesheet Entries
    class TimesheetEntry
      attr_reader :id, :remote_id, :employee, :hours_worked, :start_time, :end_time, :created_at, :modified_at,
                  :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [String] The employee the timesheet entry is for.
      # @param hours_worked [Float] The number of hours logged by the employee.
      # @param start_time [DateTime] The time at which the employee started work.
      # @param end_time [DateTime] The time at which the employee ended work.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::TimesheetEntry]
      def initialize(id: nil, remote_id: nil, employee: nil, hours_worked: nil, start_time: nil, end_time: nil,
                     created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The employee the timesheet entry is for.
        @employee = employee
        # @type [Float] The number of hours logged by the employee.
        @hours_worked = hours_worked
        # @type [DateTime] The time at which the employee started work.
        @start_time = start_time
        # @type [DateTime] The time at which the employee ended work.
        @end_time = end_time
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TimesheetEntry
      #
      # @param json_object [JSON]
      # @return [Hris::TimesheetEntry]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        employee = struct.employee
        hours_worked = struct.hours_worked
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(id: id, remote_id: remote_id, employee: employee, hours_worked: hours_worked, start_time: start_time,
            end_time: end_time, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of TimesheetEntry to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee": @employee,
          "hours_worked": @hours_worked,
          "start_time": @start_time,
          "end_time": @end_time,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.employee&.is_a?(String) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.hours_worked&.is_a?(Float) != false || raise("Passed value for field obj.hours_worked is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
