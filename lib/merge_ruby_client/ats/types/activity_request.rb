# frozen_string_literal: true

require_relative "activity_request_user"
require_relative "activity_type_enum"
require_relative "visibility_enum"
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
    class ActivityRequest
      # @return [Merge::Ats::ActivityRequestUser] The user that performed the action.
      attr_reader :user
      # @return [Merge::Ats::ActivityTypeEnum] The activity's type.
      #  - `NOTE` - NOTE
      #  - `EMAIL` - EMAIL
      #  - `OTHER` - OTHER
      attr_reader :activity_type
      # @return [String] The activity's subject.
      attr_reader :subject
      # @return [String] The activity's body.
      attr_reader :body
      # @return [Merge::Ats::VisibilityEnum] The activity's visibility.
      #  - `ADMIN_ONLY` - ADMIN_ONLY
      #  - `PUBLIC` - PUBLIC
      #  - `PRIVATE` - PRIVATE
      attr_reader :visibility
      # @return [String] The activity’s candidate.
      attr_reader :candidate
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param user [Merge::Ats::ActivityRequestUser] The user that performed the action.
      # @param activity_type [Merge::Ats::ActivityTypeEnum] The activity's type.
      #  - `NOTE` - NOTE
      #  - `EMAIL` - EMAIL
      #  - `OTHER` - OTHER
      # @param subject [String] The activity's subject.
      # @param body [String] The activity's body.
      # @param visibility [Merge::Ats::VisibilityEnum] The activity's visibility.
      #  - `ADMIN_ONLY` - ADMIN_ONLY
      #  - `PUBLIC` - PUBLIC
      #  - `PRIVATE` - PRIVATE
      # @param candidate [String] The activity’s candidate.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ActivityRequest]
      def initialize(user: OMIT, activity_type: OMIT, subject: OMIT, body: OMIT, visibility: OMIT, candidate: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @user = user if user != OMIT
        @activity_type = activity_type if activity_type != OMIT
        @subject = subject if subject != OMIT
        @body = body if body != OMIT
        @visibility = visibility if visibility != OMIT
        @candidate = candidate if candidate != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "user": user,
          "activity_type": activity_type,
          "subject": subject,
          "body": body,
          "visibility": visibility,
          "candidate": candidate,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ActivityRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::ActivityRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Ats::ActivityRequestUser.from_json(json_object: user)
        end
        activity_type = struct["activity_type"]
        subject = struct["subject"]
        body = struct["body"]
        visibility = struct["visibility"]
        candidate = struct["candidate"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          user: user,
          activity_type: activity_type,
          subject: subject,
          body: body,
          visibility: visibility,
          candidate: candidate,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of ActivityRequest to a JSON object
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
        obj.user.nil? || Merge::Ats::ActivityRequestUser.validate_raw(obj: obj.user)
        obj.activity_type&.is_a?(Merge::Ats::ActivityTypeEnum) != false || raise("Passed value for field obj.activity_type is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.visibility&.is_a?(Merge::Ats::VisibilityEnum) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
