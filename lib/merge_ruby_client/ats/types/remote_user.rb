# frozen_string_literal: true

require "date"
require_relative "remote_user_access_role"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The RemoteUser Object
    #
    # ### Description
    #
    # The `RemoteUser` object is used to represent a user with a login to the ATS system.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST RemoteUsers` endpoint to show all users for a third party.
    class RemoteUser
      attr_reader :id, :remote_id, :first_name, :last_name, :email, :disabled, :remote_created_at, :access_role,
                  :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param first_name [String] The user's first name.
      # @param last_name [String] The user's last name.
      # @param email [String] The user's email.
      # @param disabled [Boolean] Whether the user's account had been disabled.
      # @param remote_created_at [DateTime] When the third party's user was created.
      # @param access_role [Ats::RemoteUserAccessRole] The user's role.
      #   - `SUPER_ADMIN` - SUPER_ADMIN
      #   - `ADMIN` - ADMIN
      #   - `TEAM_MEMBER` - TEAM_MEMBER
      #   - `LIMITED_TEAM_MEMBER` - LIMITED_TEAM_MEMBER
      #   - `INTERVIEWER` - INTERVIEWER
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::RemoteUser]
      def initialize(id: nil, remote_id: nil, first_name: nil, last_name: nil, email: nil, disabled: nil,
                     remote_created_at: nil, access_role: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The user's first name.
        @first_name = first_name
        # @type [String] The user's last name.
        @last_name = last_name
        # @type [String] The user's email.
        @email = email
        # @type [Boolean] Whether the user's account had been disabled.
        @disabled = disabled
        # @type [DateTime] When the third party's user was created.
        @remote_created_at = remote_created_at
        # @type [Ats::RemoteUserAccessRole] The user's role.
        #   - `SUPER_ADMIN` - SUPER_ADMIN
        #   - `ADMIN` - ADMIN
        #   - `TEAM_MEMBER` - TEAM_MEMBER
        #   - `LIMITED_TEAM_MEMBER` - LIMITED_TEAM_MEMBER
        #   - `INTERVIEWER` - INTERVIEWER
        @access_role = access_role
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

      # Deserialize a JSON object to an instance of RemoteUser
      #
      # @param json_object [JSON]
      # @return [Ats::RemoteUser]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        first_name = struct.first_name
        last_name = struct.last_name
        email = struct.email
        disabled = struct.disabled
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        if parsed_json["access_role"].nil?
          access_role = nil
        else
          access_role = parsed_json["access_role"].to_json
          access_role = Ats::RemoteUserAccessRole.from_json(json_object: access_role)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, first_name: first_name, last_name: last_name, email: email,
            disabled: disabled, remote_created_at: remote_created_at, access_role: access_role, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of RemoteUser to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "first_name": @first_name,
          "last_name": @last_name,
          "email": @email,
          "disabled": @disabled,
          "remote_created_at": @remote_created_at,
          "access_role": @access_role,
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.disabled&.is_a?(Boolean) != false || raise("Passed value for field obj.disabled is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.access_role.nil? || Ats::RemoteUserAccessRole.validate_raw(obj: obj.access_role)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
