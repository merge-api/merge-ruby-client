# frozen_string_literal: true

require_relative "issue_status_enum"
require "date"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class Issue
      # @return [String]
      attr_reader :id
      # @return [Merge::Ticketing::IssueStatusEnum] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #  - `ONGOING` - ONGOING
      #  - `RESOLVED` - RESOLVED
      attr_reader :status
      # @return [String]
      attr_reader :error_description
      # @return [Hash{String => Object}]
      attr_reader :end_user
      # @return [DateTime]
      attr_reader :first_incident_time
      # @return [DateTime]
      attr_reader :last_incident_time
      # @return [Boolean]
      attr_reader :is_muted
      # @return [Array<String>]
      attr_reader :error_details
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param status [Merge::Ticketing::IssueStatusEnum] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #  - `ONGOING` - ONGOING
      #  - `RESOLVED` - RESOLVED
      # @param error_description [String]
      # @param end_user [Hash{String => Object}]
      # @param first_incident_time [DateTime]
      # @param last_incident_time [DateTime]
      # @param is_muted [Boolean]
      # @param error_details [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Issue]
      def initialize(error_description:, id: OMIT, status: OMIT, end_user: OMIT, first_incident_time: OMIT,
                     last_incident_time: OMIT, is_muted: OMIT, error_details: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @status = status if status != OMIT
        @error_description = error_description
        @end_user = end_user if end_user != OMIT
        @first_incident_time = first_incident_time if first_incident_time != OMIT
        @last_incident_time = last_incident_time if last_incident_time != OMIT
        @is_muted = is_muted if is_muted != OMIT
        @error_details = error_details if error_details != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "status": status,
          "error_description": error_description,
          "end_user": end_user,
          "first_incident_time": first_incident_time,
          "last_incident_time": last_incident_time,
          "is_muted": is_muted,
          "error_details": error_details
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Issue
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Issue]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        status = struct["status"]
        error_description = struct["error_description"]
        end_user = struct["end_user"]
        first_incident_time = unless parsed_json["first_incident_time"].nil?
                                DateTime.parse(parsed_json["first_incident_time"])
                              end
        last_incident_time = unless parsed_json["last_incident_time"].nil?
                               DateTime.parse(parsed_json["last_incident_time"])
                             end
        is_muted = struct["is_muted"]
        error_details = struct["error_details"]
        new(
          id: id,
          status: status,
          error_description: error_description,
          end_user: end_user,
          first_incident_time: first_incident_time,
          last_incident_time: last_incident_time,
          is_muted: is_muted,
          error_details: error_details,
          additional_properties: struct
        )
      end

      # Serialize an instance of Issue to a JSON object
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
        obj.status&.is_a?(Merge::Ticketing::IssueStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.error_description.is_a?(String) != false || raise("Passed value for field obj.error_description is not the expected type, validation failed.")
        obj.end_user&.is_a?(Hash) != false || raise("Passed value for field obj.end_user is not the expected type, validation failed.")
        obj.first_incident_time&.is_a?(DateTime) != false || raise("Passed value for field obj.first_incident_time is not the expected type, validation failed.")
        obj.last_incident_time&.is_a?(DateTime) != false || raise("Passed value for field obj.last_incident_time is not the expected type, validation failed.")
        obj.is_muted&.is_a?(Boolean) != false || raise("Passed value for field obj.is_muted is not the expected type, validation failed.")
        obj.error_details&.is_a?(Array) != false || raise("Passed value for field obj.error_details is not the expected type, validation failed.")
      end
    end
  end
end
