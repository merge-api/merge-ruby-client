# frozen_string_literal: true

require "date"
require_relative "time_off_employee"
require_relative "time_off_approver"
require_relative "time_off_status_enum"
require_relative "units_enum"
require_relative "request_type_enum"
require_relative "remote_data"
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
    class TimeOff
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::TimeOffEmployee] The employee requesting time off.
      attr_reader :employee
      # @return [Merge::Hris::TimeOffApprover] The Merge ID of the employee with the ability to approve the time off request.
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
      # @param employee [Merge::Hris::TimeOffEmployee] The employee requesting time off.
      # @param approver [Merge::Hris::TimeOffApprover] The Merge ID of the employee with the ability to approve the time off request.
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
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::TimeOff]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee: OMIT, approver: OMIT,
                     status: OMIT, employee_note: OMIT, units: OMIT, amount: OMIT, request_type: OMIT, start_time: OMIT, end_time: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee = employee if employee != OMIT
        @approver = approver if approver != OMIT
        @status = status if status != OMIT
        @employee_note = employee_note if employee_note != OMIT
        @units = units if units != OMIT
        @amount = amount if amount != OMIT
        @request_type = request_type if request_type != OMIT
        @start_time = start_time if start_time != OMIT
        @end_time = end_time if end_time != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "employee": employee,
          "approver": approver,
          "status": status,
          "employee_note": employee_note,
          "units": units,
          "amount": amount,
          "request_type": request_type,
          "start_time": start_time,
          "end_time": end_time,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TimeOff
      #
      # @param json_object [String]
      # @return [Merge::Hris::TimeOff]
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
          employee = Merge::Hris::TimeOffEmployee.from_json(json_object: employee)
        end
        if parsed_json["approver"].nil?
          approver = nil
        else
          approver = parsed_json["approver"].to_json
          approver = Merge::Hris::TimeOffApprover.from_json(json_object: approver)
        end
        status = parsed_json["status"]
        employee_note = parsed_json["employee_note"]
        units = parsed_json["units"]
        amount = parsed_json["amount"]
        request_type = parsed_json["request_type"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
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
          employee: employee,
          approver: approver,
          status: status,
          employee_note: employee_note,
          units: units,
          amount: amount,
          request_type: request_type,
          start_time: start_time,
          end_time: end_time,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of TimeOff to a JSON object
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
        obj.employee.nil? || Merge::Hris::TimeOffEmployee.validate_raw(obj: obj.employee)
        obj.approver.nil? || Merge::Hris::TimeOffApprover.validate_raw(obj: obj.approver)
        obj.status&.is_a?(Merge::Hris::TimeOffStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.employee_note&.is_a?(String) != false || raise("Passed value for field obj.employee_note is not the expected type, validation failed.")
        obj.units&.is_a?(Merge::Hris::UnitsEnum) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.request_type&.is_a?(Merge::Hris::RequestTypeEnum) != false || raise("Passed value for field obj.request_type is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
