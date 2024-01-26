# frozen_string_literal: true
require_relative "time_off_balance_employee"
require_relative "time_off_balance_policy_type"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The TimeOffBalance Object 
### Description

The `TimeOffBalance` object is used to represent current balances for an employee's Time Off plan.

### Usage Example

Fetch from the `LIST TimeOffBalances` endpoint and filter by `ID` to show all time off balances.
    class TimeOffBalance
      attr_reader :id, :remote_id, :employee, :balance, :used, :policy_type, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee [Hris::TimeOffBalanceEmployee] The employee the balance belongs to.
      # @param balance [Float] The current remaining PTO balance, always measured in terms of hours.
      # @param used [Float] The amount of PTO used in terms of hours.
      # @param policy_type [Hris::TimeOffBalancePolicyType] The policy type of this time off balance.  - `VACATION` - VACATION
- `SICK` - SICK
- `PERSONAL` - PERSONAL
- `JURY_DUTY` - JURY_DUTY
- `VOLUNTEER` - VOLUNTEER
- `BEREAVEMENT` - BEREAVEMENT
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Hris::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::TimeOffBalance]
      def initialize(id: nil, remote_id: nil, employee: nil, balance: nil, used: nil, policy_type: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Hris::TimeOffBalanceEmployee] The employee the balance belongs to.
        @employee = employee
        # @type [Float] The current remaining PTO balance, always measured in terms of hours.
        @balance = balance
        # @type [Float] The amount of PTO used in terms of hours.
        @used = used
        # @type [Hris::TimeOffBalancePolicyType] The policy type of this time off balance. 
- `VACATION` - VACATION
- `SICK` - SICK
- `PERSONAL` - PERSONAL
- `JURY_DUTY` - JURY_DUTY
- `VOLUNTEER` - VOLUNTEER
- `BEREAVEMENT` - BEREAVEMENT
        @policy_type = policy_type
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
      # Deserialize a JSON object to an instance of TimeOffBalance
      #
      # @param json_object [JSON] 
      # @return [Hris::TimeOffBalance]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        employee = struct.employee.to_h.to_json()
        employee = Hris::TimeOffBalanceEmployee.from_json(json_object: employee)
        balance = struct.balance
        used = struct.used
        policy_type = struct.policy_type.to_h.to_json()
        policy_type = Hris::TimeOffBalancePolicyType.from_json(json_object: policy_type)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Hris::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, employee: employee, balance: balance, used: used, policy_type: policy_type, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of TimeOffBalance to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "employee": @employee, "balance": @balance, "used": @used, "policy_type": @policy_type, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.employee.nil?() || Hris::TimeOffBalanceEmployee.validate_raw(obj: obj.employee)
        obj.balance&.is_a?(Float) != false || raise("Passed value for field obj.balance is not the expected type, validation failed.")
        obj.used&.is_a?(Float) != false || raise("Passed value for field obj.used is not the expected type, validation failed.")
        obj.policy_type.nil?() || Hris::TimeOffBalancePolicyType.validate_raw(obj: obj.policy_type)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end