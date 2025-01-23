# frozen_string_literal: true

require "json"
require_relative "../../types/remote_response"

module Merge
  module Ticketing
    class AsyncPassthrough
      class AsyncPassthroughRetrieveResponse
        # Deserialize a JSON object to an instance of AsyncPassthroughRetrieveResponse
        #
        # @param json_object [String]
        # @return [Merge::Ticketing::AsyncPassthrough::AsyncPassthroughRetrieveResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          begin
            Merge::Ticketing::RemoteResponse.validate_raw(obj: struct)
            return Merge::Ticketing::RemoteResponse.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          begin
            struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
            return struct unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          struct
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given
        #  hash and check each fields type against the current object's property
        #  definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          begin
            return Merge::Ticketing::RemoteResponse.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          begin
            return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          rescue StandardError
            # noop
          end
          raise("Passed value matched no type within the union, validation failed.")
        end
      end
    end
  end
end
