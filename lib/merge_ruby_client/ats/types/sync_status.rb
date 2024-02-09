# frozen_string_literal: true

require "date"
require_relative "sync_status_status_enum"
require_relative "selective_sync_configurations_usage_enum"
require "json"

module Merge
  module Ats
    # # The SyncStatus Object
    #
    # ### Description
    #
    # The `SyncStatus` object is used to represent the syncing state of an account
    #
    # ### Usage Example
    #
    # View the `SyncStatus` for an account to see how recently its models were synced.
    class SyncStatus
      attr_reader :model_name, :model_id, :last_sync_start, :next_sync_start, :status, :is_initial_sync,
                  :selective_sync_configurations_usage, :additional_properties

      # @param model_name [String]
      # @param model_id [String]
      # @param last_sync_start [DateTime]
      # @param next_sync_start [DateTime]
      # @param status [SYNC_STATUS_STATUS_ENUM]
      # @param is_initial_sync [Boolean]
      # @param selective_sync_configurations_usage [SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::SyncStatus]
      def initialize(model_name:, model_id:, status:, is_initial_sync:, last_sync_start: nil, next_sync_start: nil,
                     selective_sync_configurations_usage: nil, additional_properties: nil)
        # @type [String]
        @model_name = model_name
        # @type [String]
        @model_id = model_id
        # @type [DateTime]
        @last_sync_start = last_sync_start
        # @type [DateTime]
        @next_sync_start = next_sync_start
        # @type [SYNC_STATUS_STATUS_ENUM]
        @status = status
        # @type [Boolean]
        @is_initial_sync = is_initial_sync
        # @type [SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM]
        @selective_sync_configurations_usage = selective_sync_configurations_usage
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SyncStatus
      #
      # @param json_object [JSON]
      # @return [Ats::SyncStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        model_name = struct.model_name
        model_id = struct.model_id
        last_sync_start = (DateTime.parse(parsed_json["last_sync_start"]) unless parsed_json["last_sync_start"].nil?)
        next_sync_start = (DateTime.parse(parsed_json["next_sync_start"]) unless parsed_json["next_sync_start"].nil?)
        status = Ats::SYNC_STATUS_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        is_initial_sync = struct.is_initial_sync
        selective_sync_configurations_usage = Ats::SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM.key(parsed_json["selective_sync_configurations_usage"]) || parsed_json["selective_sync_configurations_usage"]
        new(model_name: model_name, model_id: model_id, last_sync_start: last_sync_start,
            next_sync_start: next_sync_start, status: status, is_initial_sync: is_initial_sync, selective_sync_configurations_usage: selective_sync_configurations_usage, additional_properties: struct)
      end

      # Serialize an instance of SyncStatus to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "model_name": @model_name,
          "model_id": @model_id,
          "last_sync_start": @last_sync_start,
          "next_sync_start": @next_sync_start,
          "status": Ats::SYNC_STATUS_STATUS_ENUM[@status] || @status,
          "is_initial_sync": @is_initial_sync,
          "selective_sync_configurations_usage": Ats::SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM[@selective_sync_configurations_usage] || @selective_sync_configurations_usage
        }.to_json
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
        obj.status.is_a?(Ats::SYNC_STATUS_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.is_initial_sync.is_a?(Boolean) != false || raise("Passed value for field obj.is_initial_sync is not the expected type, validation failed.")
        obj.selective_sync_configurations_usage&.is_a?(Ats::SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM) != false || raise("Passed value for field obj.selective_sync_configurations_usage is not the expected type, validation failed.")
      end
    end
  end
end
