# frozen_string_literal: true

require_relative "async_post_task_status_enum"
require_relative "async_post_task_result"
require "ostruct"
require "json"

module Merge
  module Accounting
    class AsyncPostTask
      # @return [Merge::Accounting::AsyncPostTaskStatusEnum]
      attr_reader :status
      # @return [Merge::Accounting::AsyncPostTaskResult]
      attr_reader :result
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param status [Merge::Accounting::AsyncPostTaskStatusEnum]
      # @param result [Merge::Accounting::AsyncPostTaskResult]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AsyncPostTask]
      def initialize(status:, result:, additional_properties: nil)
        @status = status
        @result = result
        @additional_properties = additional_properties
        @_field_set = { "status": status, "result": result }
      end

      # Deserialize a JSON object to an instance of AsyncPostTask
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AsyncPostTask]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        status = parsed_json["status"]
        if parsed_json["result"].nil?
          result = nil
        else
          result = parsed_json["result"].to_json
          result = Merge::Accounting::AsyncPostTaskResult.from_json(json_object: result)
        end
        new(
          status: status,
          result: result,
          additional_properties: struct
        )
      end

      # Serialize an instance of AsyncPostTask to a JSON object
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
        obj.status.is_a?(Merge::Accounting::AsyncPostTaskStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        Merge::Accounting::AsyncPostTaskResult.validate_raw(obj: obj.result)
      end
    end
  end
end
