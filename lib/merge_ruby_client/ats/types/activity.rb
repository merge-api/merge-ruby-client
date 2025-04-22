# frozen_string_literal: true

require "date"
require_relative "activity_user"
require_relative "activity_type_enum"
require_relative "visibility_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Activity Object
    #  ### Description
    #  The `Activity` object is used to represent an activity for a candidate performed
    #  by a user.
    #  ### Usage Example
    #  Fetch from the `LIST Activities` endpoint and filter by `ID` to show all
    #  activities.
    class Activity
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::ActivityUser] The user that performed the action.
      attr_reader :user
      # @return [DateTime] When the third party's activity was created.
      attr_reader :remote_created_at
      # @return [Merge::Ats::ActivityTypeEnum] The activity's type.
      #  * `NOTE` - NOTE
      #  * `EMAIL` - EMAIL
      #  * `OTHER` - OTHER
      attr_reader :activity_type
      # @return [String] The activity's subject.
      attr_reader :subject
      # @return [String] The activity's body.
      attr_reader :body
      # @return [Merge::Ats::VisibilityEnum] The activity's visibility.
      #  * `ADMIN_ONLY` - ADMIN_ONLY
      #  * `PUBLIC` - PUBLIC
      #  * `PRIVATE` - PRIVATE
      attr_reader :visibility
      # @return [String]
      attr_reader :candidate
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ats::RemoteData>]
      attr_reader :remote_data
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
      # @param user [Merge::Ats::ActivityUser] The user that performed the action.
      # @param remote_created_at [DateTime] When the third party's activity was created.
      # @param activity_type [Merge::Ats::ActivityTypeEnum] The activity's type.
      #  * `NOTE` - NOTE
      #  * `EMAIL` - EMAIL
      #  * `OTHER` - OTHER
      # @param subject [String] The activity's subject.
      # @param body [String] The activity's body.
      # @param visibility [Merge::Ats::VisibilityEnum] The activity's visibility.
      #  * `ADMIN_ONLY` - ADMIN_ONLY
      #  * `PUBLIC` - PUBLIC
      #  * `PRIVATE` - PRIVATE
      # @param candidate [String]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Activity]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, user: OMIT,
                     remote_created_at: OMIT, activity_type: OMIT, subject: OMIT, body: OMIT, visibility: OMIT, candidate: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @user = user if user != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @activity_type = activity_type if activity_type != OMIT
        @subject = subject if subject != OMIT
        @body = body if body != OMIT
        @visibility = visibility if visibility != OMIT
        @candidate = candidate if candidate != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "user": user,
          "remote_created_at": remote_created_at,
          "activity_type": activity_type,
          "subject": subject,
          "body": body,
          "visibility": visibility,
          "candidate": candidate,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Activity
      #
      # @param json_object [String]
      # @return [Merge::Ats::Activity]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Ats::ActivityUser.from_json(json_object: user)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        activity_type = parsed_json["activity_type"]
        subject = parsed_json["subject"]
        body = parsed_json["body"]
        visibility = parsed_json["visibility"]
        candidate = parsed_json["candidate"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ats::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          user: user,
          remote_created_at: remote_created_at,
          activity_type: activity_type,
          subject: subject,
          body: body,
          visibility: visibility,
          candidate: candidate,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Activity to a JSON object
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
        obj.user.nil? || Merge::Ats::ActivityUser.validate_raw(obj: obj.user)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.activity_type&.is_a?(Merge::Ats::ActivityTypeEnum) != false || raise("Passed value for field obj.activity_type is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.visibility&.is_a?(Merge::Ats::VisibilityEnum) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
