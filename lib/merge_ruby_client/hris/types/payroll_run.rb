# frozen_string_literal: true

require "date"
require_relative "run_state_enum"
require_relative "run_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The PayrollRun Object
    #  ### Description
    #  The `PayrollRun` object is used to represent a group of pay statements for a
    #  specific pay schedule.
    #  ### Usage Example
    #  Fetch from the `LIST PayrollRuns` endpoint and filter by `ID` to show all
    #  payroll runs.
    class PayrollRun
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::RunStateEnum] The state of the payroll run
      #  - `PAID` - PAID
      #  - `DRAFT` - DRAFT
      #  - `APPROVED` - APPROVED
      #  - `FAILED` - FAILED
      #  - `CLOSED` - CLOSED
      attr_reader :run_state
      # @return [Merge::Hris::RunTypeEnum] The type of the payroll run
      #  - `REGULAR` - REGULAR
      #  - `OFF_CYCLE` - OFF_CYCLE
      #  - `CORRECTION` - CORRECTION
      #  - `TERMINATION` - TERMINATION
      #  - `SIGN_ON_BONUS` - SIGN_ON_BONUS
      attr_reader :run_type
      # @return [DateTime] The day and time the payroll run started.
      attr_reader :start_date
      # @return [DateTime] The day and time the payroll run ended.
      attr_reader :end_date
      # @return [DateTime] The day and time the payroll run was checked.
      attr_reader :check_date
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
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
      # @param run_state [Merge::Hris::RunStateEnum] The state of the payroll run
      #  - `PAID` - PAID
      #  - `DRAFT` - DRAFT
      #  - `APPROVED` - APPROVED
      #  - `FAILED` - FAILED
      #  - `CLOSED` - CLOSED
      # @param run_type [Merge::Hris::RunTypeEnum] The type of the payroll run
      #  - `REGULAR` - REGULAR
      #  - `OFF_CYCLE` - OFF_CYCLE
      #  - `CORRECTION` - CORRECTION
      #  - `TERMINATION` - TERMINATION
      #  - `SIGN_ON_BONUS` - SIGN_ON_BONUS
      # @param start_date [DateTime] The day and time the payroll run started.
      # @param end_date [DateTime] The day and time the payroll run ended.
      # @param check_date [DateTime] The day and time the payroll run was checked.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::PayrollRun]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, run_state: OMIT, run_type: OMIT,
                     start_date: OMIT, end_date: OMIT, check_date: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @run_state = run_state if run_state != OMIT
        @run_type = run_type if run_type != OMIT
        @start_date = start_date if start_date != OMIT
        @end_date = end_date if end_date != OMIT
        @check_date = check_date if check_date != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "run_state": run_state,
          "run_type": run_type,
          "start_date": start_date,
          "end_date": end_date,
          "check_date": check_date,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PayrollRun
      #
      # @param json_object [String]
      # @return [Merge::Hris::PayrollRun]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        run_state = parsed_json["run_state"]
        run_type = parsed_json["run_type"]
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        check_date = (DateTime.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
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
          run_state: run_state,
          run_type: run_type,
          start_date: start_date,
          end_date: end_date,
          check_date: check_date,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of PayrollRun to a JSON object
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
        obj.run_state&.is_a?(Merge::Hris::RunStateEnum) != false || raise("Passed value for field obj.run_state is not the expected type, validation failed.")
        obj.run_type&.is_a?(Merge::Hris::RunTypeEnum) != false || raise("Passed value for field obj.run_type is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.check_date&.is_a?(DateTime) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
