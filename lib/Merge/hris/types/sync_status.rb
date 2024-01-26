# frozen_string_literal: true
require "date"
require "date"
require "json"

module Merge
  module Hris
    # # The SyncStatus Object 
### Description

The `SyncStatus` object is used to represent the syncing state of an account

### Usage Example

View the `SyncStatus` for an account to see how recently its models were synced.
    class SyncStatus
      attr_reader :model_name, :model_id, :last_sync_start, :next_sync_start, :status, :is_initial_sync, :selective_sync_configurations_usage, :additional_properties
      # @param model_name [String] 
      # @param model_id [String] 
      # @param last_sync_start [DateTime] 
      # @param next_sync_start [DateTime] 
      # @param status [Hash{String => String}] 
      # @param is_initial_sync [Boolean] 
      # @param selective_sync_configurations_usage [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::SyncStatus]
      def initialize(model_name:, model_id:, last_sync_start: nil, next_sync_start: nil, status:, is_initial_sync:, selective_sync_configurations_usage: nil, additional_properties: nil)
        # @type [String] 
        @model_name = model_name
        # @type [String] 
        @model_id = model_id
        # @type [DateTime] 
        @last_sync_start = last_sync_start
        # @type [DateTime] 
        @next_sync_start = next_sync_start
        # @type [Hash{String => String}] 
        @status = status
        # @type [Boolean] 
        @is_initial_sync = is_initial_sync
        # @type [Hash{String => String}] 
        @selective_sync_configurations_usage = selective_sync_configurations_usage
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of SyncStatus
      #
      # @param json_object [JSON] 
      # @return [Hris::SyncStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        model_name = struct.model_name
        model_id = struct.model_id
        last_sync_start = DateTime.parse(struct.last_sync_start)
        next_sync_start = DateTime.parse(struct.next_sync_start)
        status = SYNC_STATUS_STATUS_ENUM.key(struct.status)
        is_initial_sync = struct.is_initial_sync
        selective_sync_configurations_usage = SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM.key(struct.selective_sync_configurations_usage)
        new(model_name: model_name, model_id: model_id, last_sync_start: last_sync_start, next_sync_start: next_sync_start, status: status, is_initial_sync: is_initial_sync, selective_sync_configurations_usage: selective_sync_configurations_usage, additional_properties: struct)
      end
      # Serialize an instance of SyncStatus to a JSON object
      #
      # @return [JSON]
      def to_json
        { "model_name": @model_name, "model_id": @model_id, "last_sync_start": @last_sync_start, "next_sync_start": @next_sync_start, "status": @status, "is_initial_sync": @is_initial_sync, "selective_sync_configurations_usage": @selective_sync_configurations_usage }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
        obj.model_id.is_a?(String) != false || raise("Passed value for field obj.model_id is not the expected type, validation failed.")
        obj.last_sync_start&.is_a?(DateTime) != false || raise("Passed value for field obj.last_sync_start is not the expected type, validation failed.")
        obj.next_sync_start&.is_a?(DateTime) != false || raise("Passed value for field obj.next_sync_start is not the expected type, validation failed.")
        obj.status.is_a?(SYNC_STATUS_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.is_initial_sync.is_a?(Boolean) != false || raise("Passed value for field obj.is_initial_sync is not the expected type, validation failed.")
        obj.selective_sync_configurations_usage&.is_a?(SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM) != false || raise("Passed value for field obj.selective_sync_configurations_usage is not the expected type, validation failed.")
      end
    end
  end
end