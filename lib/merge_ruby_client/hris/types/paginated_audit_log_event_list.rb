# frozen_string_literal: true

require_relative "audit_log_event"
require "json"

module Merge
  module Hris
    class PaginatedAuditLogEventList
      attr_reader :next_, :previous, :results, :additional_properties

      # @param next_ [String]
      # @param previous [String]
      # @param results [Array<Hris::AuditLogEvent>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::PaginatedAuditLogEventList]
      def initialize(next_: nil, previous: nil, results: nil, additional_properties: nil)
        # @type [String]
        @next_ = next_
        # @type [String]
        @previous = previous
        # @type [Array<Hris::AuditLogEvent>]
        @results = results
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PaginatedAuditLogEventList
      #
      # @param json_object [JSON]
      # @return [Hris::PaginatedAuditLogEventList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        next_ = struct.next
        previous = struct.previous
        results = parsed_json["results"]&.map do |v|
          v = v.to_json
          Hris::AuditLogEvent.from_json(json_object: v)
        end
        new(next_: next_, previous: previous, results: results, additional_properties: struct)
      end

      # Serialize an instance of PaginatedAuditLogEventList to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "next": @next_, "previous": @previous, "results": @results }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.next_&.is_a?(String) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
        obj.previous&.is_a?(String) != false || raise("Passed value for field obj.previous is not the expected type, validation failed.")
        obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      end
    end
  end
end
