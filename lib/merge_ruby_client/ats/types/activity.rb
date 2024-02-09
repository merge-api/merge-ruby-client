# frozen_string_literal: true

require_relative "activity_user"
require "date"
require_relative "activity_type_enum"
require_relative "visibility_enum"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Activity Object
    #
    # ### Description
    #
    # The `Activity` object is used to represent an activity for a candidate performed by a user.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Activities` endpoint and filter by `ID` to show all activities.
    class Activity
      attr_reader :id, :remote_id, :user, :remote_created_at, :activity_type, :subject, :body, :visibility, :candidate,
                  :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param user [Ats::ActivityUser] The user that performed the action.
      # @param remote_created_at [DateTime] When the third party's activity was created.
      # @param activity_type [ACTIVITY_TYPE_ENUM] The activity's type.
      #   - `NOTE` - NOTE
      #   - `EMAIL` - EMAIL
      #   - `OTHER` - OTHER
      # @param subject [String] The activity's subject.
      # @param body [String] The activity's body.
      # @param visibility [VISIBILITY_ENUM] The activity's visibility.
      #   - `ADMIN_ONLY` - ADMIN_ONLY
      #   - `PUBLIC` - PUBLIC
      #   - `PRIVATE` - PRIVATE
      # @param candidate [String] The activity’s candidate.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Activity]
      def initialize(id: nil, remote_id: nil, user: nil, remote_created_at: nil, activity_type: nil, subject: nil,
                     body: nil, visibility: nil, candidate: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::ActivityUser] The user that performed the action.
        @user = user
        # @type [DateTime] When the third party's activity was created.
        @remote_created_at = remote_created_at
        # @type [ACTIVITY_TYPE_ENUM] The activity's type.
        #   - `NOTE` - NOTE
        #   - `EMAIL` - EMAIL
        #   - `OTHER` - OTHER
        @activity_type = activity_type
        # @type [String] The activity's subject.
        @subject = subject
        # @type [String] The activity's body.
        @body = body
        # @type [VISIBILITY_ENUM] The activity's visibility.
        #   - `ADMIN_ONLY` - ADMIN_ONLY
        #   - `PUBLIC` - PUBLIC
        #   - `PRIVATE` - PRIVATE
        @visibility = visibility
        # @type [String] The activity’s candidate.
        @candidate = candidate
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Ats::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Activity
      #
      # @param json_object [JSON]
      # @return [Ats::Activity]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Ats::ActivityUser.from_json(json_object: user)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        activity_type = Ats::ACTIVITY_TYPE_ENUM.key(parsed_json["activity_type"]) || parsed_json["activity_type"]
        subject = struct.subject
        body = struct.body
        visibility = Ats::VISIBILITY_ENUM.key(parsed_json["visibility"]) || parsed_json["visibility"]
        candidate = struct.candidate
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, user: user, remote_created_at: remote_created_at,
            activity_type: activity_type, subject: subject, body: body, visibility: visibility, candidate: candidate, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Activity to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "user": @user,
          "remote_created_at": @remote_created_at,
          "activity_type": Ats::ACTIVITY_TYPE_ENUM[@activity_type] || @activity_type,
          "subject": @subject,
          "body": @body,
          "visibility": Ats::VISIBILITY_ENUM[@visibility] || @visibility,
          "candidate": @candidate,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.user.nil? || Ats::ActivityUser.validate_raw(obj: obj.user)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.activity_type&.is_a?(Ats::ACTIVITY_TYPE_ENUM) != false || raise("Passed value for field obj.activity_type is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.visibility&.is_a?(Ats::VISIBILITY_ENUM) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
