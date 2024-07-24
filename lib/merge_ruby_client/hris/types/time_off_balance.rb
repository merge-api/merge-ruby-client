# frozen_string_literal: true

require "date"
require_relative "time_off_balance_employee"
require_relative "policy_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The TimeOffBalance Object
    #  ### Description
    #  The `TimeOffBalance` object is used to represent current balances for an
    #  employee's Time Off plan.
    #  ### Usage Example
    #  Fetch from the `LIST TimeOffBalances` endpoint and filter by `ID` to show all
    #  time off balances.
    class TimeOffBalance
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Hris::TimeOffBalanceEmployee] The employee the balance belongs to.
      attr_reader :employee
      # @return [Float] The current remaining PTO balance, always measured in terms of hours.
      attr_reader :balance
      # @return [Float] The amount of PTO used in terms of hours.
      attr_reader :used
      # @return [Merge::Hris::PolicyTypeEnum] The policy type of this time off balance.
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      attr_reader :policy_type
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
      # @param employee [Merge::Hris::TimeOffBalanceEmployee] The employee the balance belongs to.
      # @param balance [Float] The current remaining PTO balance, always measured in terms of hours.
      # @param used [Float] The amount of PTO used in terms of hours.
      # @param policy_type [Merge::Hris::PolicyTypeEnum] The policy type of this time off balance.
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::TimeOffBalance]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, employee: OMIT, balance: OMIT,
                     used: OMIT, policy_type: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @employee = employee if employee != OMIT
        @balance = balance if balance != OMIT
        @used = used if used != OMIT
        @policy_type = policy_type if policy_type != OMIT
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
          "balance": balance,
          "used": used,
          "policy_type": policy_type,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TimeOffBalance
      #
      # @param json_object [String]
      # @return [Merge::Hris::TimeOffBalance]
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
          employee = Merge::Hris::TimeOffBalanceEmployee.from_json(json_object: employee)
        end
        balance = parsed_json["balance"]
        used = parsed_json["used"]
        policy_type = parsed_json["policy_type"]
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
          balance: balance,
          used: used,
          policy_type: policy_type,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of TimeOffBalance to a JSON object
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
        obj.employee.nil? || Merge::Hris::TimeOffBalanceEmployee.validate_raw(obj: obj.employee)
        obj.balance&.is_a?(Float) != false || raise("Passed value for field obj.balance is not the expected type, validation failed.")
        obj.used&.is_a?(Float) != false || raise("Passed value for field obj.used is not the expected type, validation failed.")
        obj.policy_type&.is_a?(Merge::Hris::PolicyTypeEnum) != false || raise("Passed value for field obj.policy_type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
