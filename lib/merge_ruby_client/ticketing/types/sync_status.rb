# frozen_string_literal: true

require "date"
require_relative "sync_status_status_enum"
require_relative "selective_sync_configurations_usage_enum"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The SyncStatus Object
    #  ### Description
    #  The `SyncStatus` object is used to represent the syncing state of an account
    #  ### Usage Example
    #  View the `SyncStatus` for an account to see how recently its models were synced.
    class SyncStatus
      # @return [String]
      attr_reader :model_name
      # @return [String]
      attr_reader :model_id
      # @return [DateTime]
      attr_reader :last_sync_start
      # @return [DateTime]
      attr_reader :next_sync_start
      # @return [Merge::Ticketing::SyncStatusStatusEnum]
      attr_reader :status
      # @return [Boolean]
      attr_reader :is_initial_sync
      # @return [Merge::Ticketing::SelectiveSyncConfigurationsUsageEnum]
      attr_reader :selective_sync_configurations_usage
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model_name [String]
      # @param model_id [String]
      # @param last_sync_start [DateTime]
      # @param next_sync_start [DateTime]
      # @param status [Merge::Ticketing::SyncStatusStatusEnum]
      # @param is_initial_sync [Boolean]
      # @param selective_sync_configurations_usage [Merge::Ticketing::SelectiveSyncConfigurationsUsageEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::SyncStatus]
      def initialize(model_name:, model_id:, status:, is_initial_sync:, last_sync_start: OMIT, next_sync_start: OMIT,
                     selective_sync_configurations_usage: OMIT, additional_properties: nil)
        @model_name = model_name
        @model_id = model_id
        @last_sync_start = last_sync_start if last_sync_start != OMIT
        @next_sync_start = next_sync_start if next_sync_start != OMIT
        @status = status
        @is_initial_sync = is_initial_sync
        if selective_sync_configurations_usage != OMIT
          @selective_sync_configurations_usage = selective_sync_configurations_usage
        end
        @additional_properties = additional_properties
        @_field_set = {
          "model_name": model_name,
          "model_id": model_id,
          "last_sync_start": last_sync_start,
          "next_sync_start": next_sync_start,
          "status": status,
          "is_initial_sync": is_initial_sync,
          "selective_sync_configurations_usage": selective_sync_configurations_usage
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SyncStatus
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::SyncStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        model_name = parsed_json["model_name"]
        model_id = parsed_json["model_id"]
        last_sync_start = (DateTime.parse(parsed_json["last_sync_start"]) unless parsed_json["last_sync_start"].nil?)
        next_sync_start = (DateTime.parse(parsed_json["next_sync_start"]) unless parsed_json["next_sync_start"].nil?)
        status = parsed_json["status"]
        is_initial_sync = parsed_json["is_initial_sync"]
        selective_sync_configurations_usage = parsed_json["selective_sync_configurations_usage"]
        new(
          model_name: model_name,
          model_id: model_id,
          last_sync_start: last_sync_start,
          next_sync_start: next_sync_start,
          status: status,
          is_initial_sync: is_initial_sync,
          selective_sync_configurations_usage: selective_sync_configurations_usage,
          additional_properties: struct
        )
      end

      # Serialize an instance of SyncStatus to a JSON object
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
        obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
        obj.model_id.is_a?(String) != false || raise("Passed value for field obj.model_id is not the expected type, validation failed.")
        obj.last_sync_start&.is_a?(DateTime) != false || raise("Passed value for field obj.last_sync_start is not the expected type, validation failed.")
        obj.next_sync_start&.is_a?(DateTime) != false || raise("Passed value for field obj.next_sync_start is not the expected type, validation failed.")
        obj.status.is_a?(Merge::Ticketing::SyncStatusStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.is_initial_sync.is_a?(Boolean) != false || raise("Passed value for field obj.is_initial_sync is not the expected type, validation failed.")
        obj.selective_sync_configurations_usage&.is_a?(Merge::Ticketing::SelectiveSyncConfigurationsUsageEnum) != false || raise("Passed value for field obj.selective_sync_configurations_usage is not the expected type, validation failed.")
      end
    end
  end
end
