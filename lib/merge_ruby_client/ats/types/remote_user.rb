# frozen_string_literal: true

require "date"
require_relative "access_role_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The RemoteUser Object
    #  ### Description
    #  The `RemoteUser` object is used to represent a user with a login to the ATS
    #  system.
    #  ### Usage Example
    #  Fetch from the `LIST RemoteUsers` endpoint to show all users for a third party.
    class RemoteUser
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] The user's first name.
      attr_reader :first_name
      # @return [String] The user's last name.
      attr_reader :last_name
      # @return [String] The user's email.
      attr_reader :email
      # @return [Boolean] Whether the user's account had been disabled.
      attr_reader :disabled
      # @return [DateTime] When the third party's user was created.
      attr_reader :remote_created_at
      # @return [Merge::Ats::AccessRoleEnum] The user's role.
      #  - `SUPER_ADMIN` - SUPER_ADMIN
      #  - `ADMIN` - ADMIN
      #  - `TEAM_MEMBER` - TEAM_MEMBER
      #  - `LIMITED_TEAM_MEMBER` - LIMITED_TEAM_MEMBER
      #  - `INTERVIEWER` - INTERVIEWER
      attr_reader :access_role
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
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
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param first_name [String] The user's first name.
      # @param last_name [String] The user's last name.
      # @param email [String] The user's email.
      # @param disabled [Boolean] Whether the user's account had been disabled.
      # @param remote_created_at [DateTime] When the third party's user was created.
      # @param access_role [Merge::Ats::AccessRoleEnum] The user's role.
      #  - `SUPER_ADMIN` - SUPER_ADMIN
      #  - `ADMIN` - ADMIN
      #  - `TEAM_MEMBER` - TEAM_MEMBER
      #  - `LIMITED_TEAM_MEMBER` - LIMITED_TEAM_MEMBER
      #  - `INTERVIEWER` - INTERVIEWER
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::RemoteUser]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, first_name: OMIT, last_name: OMIT,
                     email: OMIT, disabled: OMIT, remote_created_at: OMIT, access_role: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @email = email if email != OMIT
        @disabled = disabled if disabled != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @access_role = access_role if access_role != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "first_name": first_name,
          "last_name": last_name,
          "email": email,
          "disabled": disabled,
          "remote_created_at": remote_created_at,
          "access_role": access_role,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteUser
      #
      # @param json_object [String]
      # @return [Merge::Ats::RemoteUser]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        first_name = struct["first_name"]
        last_name = struct["last_name"]
        email = struct["email"]
        disabled = struct["disabled"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        access_role = struct["access_role"]
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Ats::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          first_name: first_name,
          last_name: last_name,
          email: email,
          disabled: disabled,
          remote_created_at: remote_created_at,
          access_role: access_role,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteUser to a JSON object
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.disabled&.is_a?(Boolean) != false || raise("Passed value for field obj.disabled is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.access_role&.is_a?(Merge::Ats::AccessRoleEnum) != false || raise("Passed value for field obj.access_role is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
