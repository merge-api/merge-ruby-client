# frozen_string_literal: true

require_relative "payroll_run_run_state"
require_relative "payroll_run_run_type"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The PayrollRun Object
    #
    # ### Description
    #
    # The `PayrollRun` object is used to represent a group of pay statements for a specific pay schedule.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST PayrollRuns` endpoint and filter by `ID` to show all payroll runs.
    class PayrollRun
      attr_reader :id, :remote_id, :run_state, :run_type, :start_date, :end_date, :check_date, :remote_was_deleted,
                  :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param run_state [Hris::PayrollRunRunState] The state of the payroll run
      #   - `PAID` - PAID
      #   - `DRAFT` - DRAFT
      #   - `APPROVED` - APPROVED
      #   - `FAILED` - FAILED
      #   - `CLOSED` - CLOSED
      # @param run_type [Hris::PayrollRunRunType] The type of the payroll run
      #   - `REGULAR` - REGULAR
      #   - `OFF_CYCLE` - OFF_CYCLE
      #   - `CORRECTION` - CORRECTION
      #   - `TERMINATION` - TERMINATION
      #   - `SIGN_ON_BONUS` - SIGN_ON_BONUS
      # @param start_date [DateTime] The day and time the payroll run started.
      # @param end_date [DateTime] The day and time the payroll run ended.
      # @param check_date [DateTime] The day and time the payroll run was checked.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::PayrollRun]
      def initialize(id: nil, remote_id: nil, run_state: nil, run_type: nil, start_date: nil, end_date: nil,
                     check_date: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::PayrollRunRunState] The state of the payroll run
        #   - `PAID` - PAID
        #   - `DRAFT` - DRAFT
        #   - `APPROVED` - APPROVED
        #   - `FAILED` - FAILED
        #   - `CLOSED` - CLOSED
        @run_state = run_state
        # @type [Hris::PayrollRunRunType] The type of the payroll run
        #   - `REGULAR` - REGULAR
        #   - `OFF_CYCLE` - OFF_CYCLE
        #   - `CORRECTION` - CORRECTION
        #   - `TERMINATION` - TERMINATION
        #   - `SIGN_ON_BONUS` - SIGN_ON_BONUS
        @run_type = run_type
        # @type [DateTime] The day and time the payroll run started.
        @start_date = start_date
        # @type [DateTime] The day and time the payroll run ended.
        @end_date = end_date
        # @type [DateTime] The day and time the payroll run was checked.
        @check_date = check_date
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
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

      # Deserialize a JSON object to an instance of PayrollRun
      #
      # @param json_object [JSON]
      # @return [Hris::PayrollRun]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["run_state"].nil?
          run_state = nil
        else
          run_state = parsed_json["run_state"].to_json
          run_state = Hris::PayrollRunRunState.from_json(json_object: run_state)
        end
        if parsed_json["run_type"].nil?
          run_type = nil
        else
          run_type = parsed_json["run_type"].to_json
          run_type = Hris::PayrollRunRunType.from_json(json_object: run_type)
        end
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        check_date = (DateTime.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, run_state: run_state, run_type: run_type, start_date: start_date,
            end_date: end_date, check_date: check_date, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of PayrollRun to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "run_state": @run_state,
          "run_type": @run_type,
          "start_date": @start_date,
          "end_date": @end_date,
          "check_date": @check_date,
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
        obj.run_state.nil? || Hris::PayrollRunRunState.validate_raw(obj: obj.run_state)
        obj.run_type.nil? || Hris::PayrollRunRunType.validate_raw(obj: obj.run_type)
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.check_date&.is_a?(DateTime) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
