# frozen_string_literal: true

require_relative "activity_request_user"
require_relative "activity_type_enum"
require_relative "visibility_enum"
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
    class ActivityRequest
      attr_reader :user, :activity_type, :subject, :body, :visibility, :candidate, :integration_params,
                  :linked_account_params, :additional_properties

      # @param user [Ats::ActivityRequestUser] The user that performed the action.
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
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ActivityRequest]
      def initialize(user: nil, activity_type: nil, subject: nil, body: nil, visibility: nil, candidate: nil,
                     integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [Ats::ActivityRequestUser] The user that performed the action.
        @user = user
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
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ActivityRequest
      #
      # @param json_object [JSON]
      # @return [Ats::ActivityRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Ats::ActivityRequestUser.from_json(json_object: user)
        end
        activity_type = Ats::ACTIVITY_TYPE_ENUM.key(parsed_json["activity_type"]) || parsed_json["activity_type"]
        subject = struct.subject
        body = struct.body
        visibility = Ats::VISIBILITY_ENUM.key(parsed_json["visibility"]) || parsed_json["visibility"]
        candidate = struct.candidate
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(user: user, activity_type: activity_type, subject: subject, body: body, visibility: visibility,
            candidate: candidate, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of ActivityRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "user": @user,
          "activity_type": Ats::ACTIVITY_TYPE_ENUM[@activity_type] || @activity_type,
          "subject": @subject,
          "body": @body,
          "visibility": Ats::VISIBILITY_ENUM[@visibility] || @visibility,
          "candidate": @candidate,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user.nil? || Ats::ActivityRequestUser.validate_raw(obj: obj.user)
        obj.activity_type&.is_a?(Ats::ACTIVITY_TYPE_ENUM) != false || raise("Passed value for field obj.activity_type is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.visibility&.is_a?(Ats::VISIBILITY_ENUM) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
