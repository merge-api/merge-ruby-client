# frozen_string_literal: true

require "date"
require_relative "activity_type_enum"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Engagement Type Object
    #  ### Description
    #  The `Engagement Type` object is used to represent an interaction activity. A
    #  given `Engagement` typically has an `Engagement Type` object represented in the
    #  engagement_type field.
    #  ### Usage Example
    #  TODO
    class EngagementType
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Crm::ActivityTypeEnum] The engagement type's activity type.
      #  - `CALL` - CALL
      #  - `MEETING` - MEETING
      #  - `EMAIL` - EMAIL
      attr_reader :activity_type
      # @return [String] The engagement type's name.
      attr_reader :name
      # @return [Array<Merge::Crm::RemoteField>]
      attr_reader :remote_fields
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
      # @param activity_type [Merge::Crm::ActivityTypeEnum] The engagement type's activity type.
      #  - `CALL` - CALL
      #  - `MEETING` - MEETING
      #  - `EMAIL` - EMAIL
      # @param name [String] The engagement type's name.
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::EngagementType]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, activity_type: OMIT, name: OMIT,
                     remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @activity_type = activity_type if activity_type != OMIT
        @name = name if name != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "activity_type": activity_type,
          "name": name,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EngagementType
      #
      # @param json_object [String]
      # @return [Merge::Crm::EngagementType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        activity_type = parsed_json["activity_type"]
        name = parsed_json["name"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          activity_type: activity_type,
          name: name,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of EngagementType to a JSON object
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
        obj.activity_type&.is_a?(Merge::Crm::ActivityTypeEnum) != false || raise("Passed value for field obj.activity_type is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
