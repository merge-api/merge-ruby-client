# frozen_string_literal: true

require_relative "time_off_request_employee"
require_relative "time_off_request_approver"
require_relative "time_off_status_enum"
require_relative "units_enum"
require_relative "request_type_enum"
require "date"
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
    class TimeOffRequest
      attr_reader :employee, :approver, :status, :employee_note, :units, :amount, :request_type, :start_time,
                  :end_time, :integration_params, :linked_account_params, :additional_properties

      # @param employee [Hris::TimeOffRequestEmployee] The employee requesting time off.
      # @param approver [Hris::TimeOffRequestApprover] The Merge ID of the employee with the ability to approve the time off request.
      # @param status [TIME_OFF_STATUS_ENUM] The status of this time off request.
      #   - `REQUESTED` - REQUESTED
      #   - `APPROVED` - APPROVED
      #   - `DECLINED` - DECLINED
      #   - `CANCELLED` - CANCELLED
      #   - `DELETED` - DELETED
      # @param employee_note [String] The employee note for this time off request.
      # @param units [UNITS_ENUM] The measurement that the third-party integration uses to count time requested.
      #   - `HOURS` - HOURS
      #   - `DAYS` - DAYS
      # @param amount [Float] The time off quantity measured by the prescribed “units”.
      # @param request_type [REQUEST_TYPE_ENUM] The type of time off request.
      #   - `VACATION` - VACATION
      #   - `SICK` - SICK
      #   - `PERSONAL` - PERSONAL
      #   - `JURY_DUTY` - JURY_DUTY
      #   - `VOLUNTEER` - VOLUNTEER
      #   - `BEREAVEMENT` - BEREAVEMENT
      # @param start_time [DateTime] The day and time of the start of the time requested off.
      # @param end_time [DateTime] The day and time of the end of the time requested off.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::TimeOffRequest]
      def initialize(employee: nil, approver: nil, status: nil, employee_note: nil, units: nil, amount: nil,
                     request_type: nil, start_time: nil, end_time: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [Hris::TimeOffRequestEmployee] The employee requesting time off.
        @employee = employee
        # @type [Hris::TimeOffRequestApprover] The Merge ID of the employee with the ability to approve the time off request.
        @approver = approver
        # @type [TIME_OFF_STATUS_ENUM] The status of this time off request.
        #   - `REQUESTED` - REQUESTED
        #   - `APPROVED` - APPROVED
        #   - `DECLINED` - DECLINED
        #   - `CANCELLED` - CANCELLED
        #   - `DELETED` - DELETED
        @status = status
        # @type [String] The employee note for this time off request.
        @employee_note = employee_note
        # @type [UNITS_ENUM] The measurement that the third-party integration uses to count time requested.
        #   - `HOURS` - HOURS
        #   - `DAYS` - DAYS
        @units = units
        # @type [Float] The time off quantity measured by the prescribed “units”.
        @amount = amount
        # @type [REQUEST_TYPE_ENUM] The type of time off request.
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
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TimeOffRequest
      #
      # @param json_object [JSON]
      # @return [Hris::TimeOffRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Hris::TimeOffRequestEmployee.from_json(json_object: employee)
        end
        if parsed_json["approver"].nil?
          approver = nil
        else
          approver = parsed_json["approver"].to_json
          approver = Hris::TimeOffRequestApprover.from_json(json_object: approver)
        end
        status = Hris::TIME_OFF_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        employee_note = struct.employee_note
        units = Hris::UNITS_ENUM.key(parsed_json["units"]) || parsed_json["units"]
        amount = struct.amount
        request_type = Hris::REQUEST_TYPE_ENUM.key(parsed_json["request_type"]) || parsed_json["request_type"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(employee: employee, approver: approver, status: status, employee_note: employee_note, units: units,
            amount: amount, request_type: request_type, start_time: start_time, end_time: end_time, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of TimeOffRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "employee": @employee,
          "approver": @approver,
          "status": Hris::TIME_OFF_STATUS_ENUM[@status] || @status,
          "employee_note": @employee_note,
          "units": Hris::UNITS_ENUM[@units] || @units,
          "amount": @amount,
          "request_type": Hris::REQUEST_TYPE_ENUM[@request_type] || @request_type,
          "start_time": @start_time,
          "end_time": @end_time,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.employee.nil? || Hris::TimeOffRequestEmployee.validate_raw(obj: obj.employee)
        obj.approver.nil? || Hris::TimeOffRequestApprover.validate_raw(obj: obj.approver)
        obj.status&.is_a?(Hris::TIME_OFF_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.employee_note&.is_a?(String) != false || raise("Passed value for field obj.employee_note is not the expected type, validation failed.")
        obj.units&.is_a?(Hris::UNITS_ENUM) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.request_type&.is_a?(Hris::REQUEST_TYPE_ENUM) != false || raise("Passed value for field obj.request_type is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
