# frozen_string_literal: true

require_relative "time_off_request_employee"
require_relative "time_off_request_approver"
require_relative "time_off_status_enum"
require_relative "units_enum"
require_relative "request_type_enum"
require "date"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The TimeOff Object
    #  ### Description
    #  The `TimeOff` object is used to represent all employees' Time Off entries.
    #  ### Usage Example
    #  Fetch from the `LIST TimeOffs` endpoint and filter by `ID` to show all time off
    #  requests.
    class TimeOffRequest
      # @return [Merge::Hris::TimeOffRequestEmployee] The employee requesting time off.
      attr_reader :employee
      # @return [Merge::Hris::TimeOffRequestApprover] The Merge ID of the employee with the ability to approve the time off request.
      attr_reader :approver
      # @return [Merge::Hris::TimeOffStatusEnum] The status of this time off request.
      #  - `REQUESTED` - REQUESTED
      #  - `APPROVED` - APPROVED
      #  - `DECLINED` - DECLINED
      #  - `CANCELLED` - CANCELLED
      #  - `DELETED` - DELETED
      attr_reader :status
      # @return [String] The employee note for this time off request.
      attr_reader :employee_note
      # @return [Merge::Hris::UnitsEnum] The measurement that the third-party integration uses to count time requested.
      #  - `HOURS` - HOURS
      #  - `DAYS` - DAYS
      attr_reader :units
      # @return [Float] The time off quantity measured by the prescribed “units”.
      attr_reader :amount
      # @return [Merge::Hris::RequestTypeEnum] The type of time off request.
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      attr_reader :request_type
      # @return [DateTime] The day and time of the start of the time requested off.
      attr_reader :start_time
      # @return [DateTime] The day and time of the end of the time requested off.
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

      # @param employee [Merge::Hris::TimeOffRequestEmployee] The employee requesting time off.
      # @param approver [Merge::Hris::TimeOffRequestApprover] The Merge ID of the employee with the ability to approve the time off request.
      # @param status [Merge::Hris::TimeOffStatusEnum] The status of this time off request.
      #  - `REQUESTED` - REQUESTED
      #  - `APPROVED` - APPROVED
      #  - `DECLINED` - DECLINED
      #  - `CANCELLED` - CANCELLED
      #  - `DELETED` - DELETED
      # @param employee_note [String] The employee note for this time off request.
      # @param units [Merge::Hris::UnitsEnum] The measurement that the third-party integration uses to count time requested.
      #  - `HOURS` - HOURS
      #  - `DAYS` - DAYS
      # @param amount [Float] The time off quantity measured by the prescribed “units”.
      # @param request_type [Merge::Hris::RequestTypeEnum] The type of time off request.
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      # @param start_time [DateTime] The day and time of the start of the time requested off.
      # @param end_time [DateTime] The day and time of the end of the time requested off.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::TimeOffRequest]
      def initialize(employee: OMIT, approver: OMIT, status: OMIT, employee_note: OMIT, units: OMIT, amount: OMIT,
                     request_type: OMIT, start_time: OMIT, end_time: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @employee = employee if employee != OMIT
        @approver = approver if approver != OMIT
        @status = status if status != OMIT
        @employee_note = employee_note if employee_note != OMIT
        @units = units if units != OMIT
        @amount = amount if amount != OMIT
        @request_type = request_type if request_type != OMIT
        @start_time = start_time if start_time != OMIT
        @end_time = end_time if end_time != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "employee": employee,
          "approver": approver,
          "status": status,
          "employee_note": employee_note,
          "units": units,
          "amount": amount,
          "request_type": request_type,
          "start_time": start_time,
          "end_time": end_time,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TimeOffRequest
      #
      # @param json_object [String]
      # @return [Merge::Hris::TimeOffRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Hris::TimeOffRequestEmployee.from_json(json_object: employee)
        end
        if parsed_json["approver"].nil?
          approver = nil
        else
          approver = parsed_json["approver"].to_json
          approver = Merge::Hris::TimeOffRequestApprover.from_json(json_object: approver)
        end
        status = struct["status"]
        employee_note = struct["employee_note"]
        units = struct["units"]
        amount = struct["amount"]
        request_type = struct["request_type"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          employee: employee,
          approver: approver,
          status: status,
          employee_note: employee_note,
          units: units,
          amount: amount,
          request_type: request_type,
          start_time: start_time,
          end_time: end_time,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of TimeOffRequest to a JSON object
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
        obj.employee.nil? || Merge::Hris::TimeOffRequestEmployee.validate_raw(obj: obj.employee)
        obj.approver.nil? || Merge::Hris::TimeOffRequestApprover.validate_raw(obj: obj.approver)
        obj.status&.is_a?(Merge::Hris::TimeOffStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.employee_note&.is_a?(String) != false || raise("Passed value for field obj.employee_note is not the expected type, validation failed.")
        obj.units&.is_a?(Merge::Hris::UnitsEnum) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.request_type&.is_a?(Merge::Hris::RequestTypeEnum) != false || raise("Passed value for field obj.request_type is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
