# frozen_string_literal: true

require_relative "time_off_employee"
require_relative "time_off_approver"
require_relative "time_off_status"
require_relative "time_off_units"
require_relative "time_off_request_type"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The TimeOff Object
    #
    # ### Description
    #
    # The `TimeOff` object is used to represent all employees' Time Off entries.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST TimeOffs` endpoint and filter by `ID` to show all time off requests.
    class TimeOff
      attr_reader :id, :remote_id, :employee, :approver, :status, :employee_note, :units, :amount, :request_type,
                  :start_time, :end_time, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [Hris::TimeOffEmployee] The employee requesting time off.
      # @param approver [Hris::TimeOffApprover] The Merge ID of the employee with the ability to approve the time off request.
      # @param status [Hris::TimeOffStatus] The status of this time off request.
      #   - `REQUESTED` - REQUESTED
      #   - `APPROVED` - APPROVED
      #   - `DECLINED` - DECLINED
      #   - `CANCELLED` - CANCELLED
      #   - `DELETED` - DELETED
      # @param employee_note [String] The employee note for this time off request.
      # @param units [Hris::TimeOffUnits] The measurement that the third-party integration uses to count time requested.
      #   - `HOURS` - HOURS
      #   - `DAYS` - DAYS
      # @param amount [Float] The time off quantity measured by the prescribed “units”.
      # @param request_type [Hris::TimeOffRequestType] The type of time off request.
      #   - `VACATION` - VACATION
      #   - `SICK` - SICK
      #   - `PERSONAL` - PERSONAL
      #   - `JURY_DUTY` - JURY_DUTY
      #   - `VOLUNTEER` - VOLUNTEER
      #   - `BEREAVEMENT` - BEREAVEMENT
      # @param start_time [DateTime] The day and time of the start of the time requested off.
      # @param end_time [DateTime] The day and time of the end of the time requested off.
      # @param remote_was_deleted [Boolean]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::TimeOff]
      def initialize(id: nil, remote_id: nil, employee: nil, approver: nil, status: nil, employee_note: nil,
                     units: nil, amount: nil, request_type: nil, start_time: nil, end_time: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::TimeOffEmployee] The employee requesting time off.
        @employee = employee
        # @type [Hris::TimeOffApprover] The Merge ID of the employee with the ability to approve the time off request.
        @approver = approver
        # @type [Hris::TimeOffStatus] The status of this time off request.
        #   - `REQUESTED` - REQUESTED
        #   - `APPROVED` - APPROVED
        #   - `DECLINED` - DECLINED
        #   - `CANCELLED` - CANCELLED
        #   - `DELETED` - DELETED
        @status = status
        # @type [String] The employee note for this time off request.
        @employee_note = employee_note
        # @type [Hris::TimeOffUnits] The measurement that the third-party integration uses to count time requested.
        #   - `HOURS` - HOURS
        #   - `DAYS` - DAYS
        @units = units
        # @type [Float] The time off quantity measured by the prescribed “units”.
        @amount = amount
        # @type [Hris::TimeOffRequestType] The type of time off request.
        #   - `VACATION` - VACATION
        #   - `SICK` - SICK
        #   - `PERSONAL` - PERSONAL
        #   - `JURY_DUTY` - JURY_DUTY
        #   - `VOLUNTEER` - VOLUNTEER
        #   - `BEREAVEMENT` - BEREAVEMENT
        @request_type = request_type
        # @type [DateTime] The day and time of the start of the time requested off.
        @start_time = start_time
        # @type [DateTime] The day and time of the end of the time requested off.
        @end_time = end_time
        # @type [Boolean]
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

      # Deserialize a JSON object to an instance of TimeOff
      #
      # @param json_object [JSON]
      # @return [Hris::TimeOff]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Hris::TimeOffEmployee.from_json(json_object: employee)
        end
        if parsed_json["approver"].nil?
          approver = nil
        else
          approver = parsed_json["approver"].to_json
          approver = Hris::TimeOffApprover.from_json(json_object: approver)
        end
        if parsed_json["status"].nil?
          status = nil
        else
          status = parsed_json["status"].to_json
          status = Hris::TimeOffStatus.from_json(json_object: status)
        end
        employee_note = struct.employee_note
        if parsed_json["units"].nil?
          units = nil
        else
          units = parsed_json["units"].to_json
          units = Hris::TimeOffUnits.from_json(json_object: units)
        end
        amount = struct.amount
        if parsed_json["request_type"].nil?
          request_type = nil
        else
          request_type = parsed_json["request_type"].to_json
          request_type = Hris::TimeOffRequestType.from_json(json_object: request_type)
        end
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, employee: employee, approver: approver, status: status,
            employee_note: employee_note, units: units, amount: amount, request_type: request_type, start_time: start_time, end_time: end_time, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of TimeOff to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee": @employee,
          "approver": @approver,
          "status": @status,
          "employee_note": @employee_note,
          "units": @units,
          "amount": @amount,
          "request_type": @request_type,
          "start_time": @start_time,
          "end_time": @end_time,
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
        obj.employee.nil? || Hris::TimeOffEmployee.validate_raw(obj: obj.employee)
        obj.approver.nil? || Hris::TimeOffApprover.validate_raw(obj: obj.approver)
        obj.status.nil? || Hris::TimeOffStatus.validate_raw(obj: obj.status)
        obj.employee_note&.is_a?(String) != false || raise("Passed value for field obj.employee_note is not the expected type, validation failed.")
        obj.units.nil? || Hris::TimeOffUnits.validate_raw(obj: obj.units)
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.request_type.nil? || Hris::TimeOffRequestType.validate_raw(obj: obj.request_type)
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
