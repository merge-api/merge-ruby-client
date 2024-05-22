# frozen_string_literal: true

require "date"
require_relative "user_teams_item"
require_relative "user_roles_item"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The User Object
    #  ### Description
    #  The `User` object is used to represent an employee within a company.
    #  ### Usage Example
    #  TODO
    class User
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The user's name.
      attr_reader :name
      # @return [String] The user's email address.
      attr_reader :email_address
      # @return [Boolean] Whether or not the user is active.
      attr_reader :is_active
      # @return [Array<Merge::Ticketing::UserTeamsItem>]
      attr_reader :teams
      # @return [Array<Merge::Ticketing::UserRolesItem>]
      attr_reader :roles
      # @return [String] The user's avatar picture.
      attr_reader :avatar
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ticketing::RemoteData>]
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
      # @param name [String] The user's name.
      # @param email_address [String] The user's email address.
      # @param is_active [Boolean] Whether or not the user is active.
      # @param teams [Array<Merge::Ticketing::UserTeamsItem>]
      # @param roles [Array<Merge::Ticketing::UserRolesItem>]
      # @param avatar [String] The user's avatar picture.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::User]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, email_address: OMIT,
                     is_active: OMIT, teams: OMIT, roles: OMIT, avatar: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @email_address = email_address if email_address != OMIT
        @is_active = is_active if is_active != OMIT
        @teams = teams if teams != OMIT
        @roles = roles if roles != OMIT
        @avatar = avatar if avatar != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "email_address": email_address,
          "is_active": is_active,
          "teams": teams,
          "roles": roles,
          "avatar": avatar,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of User
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::User]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = struct["name"]
        email_address = struct["email_address"]
        is_active = struct["is_active"]
        teams = parsed_json["teams"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::UserTeamsItem.from_json(json_object: v)
        end
        roles = parsed_json["roles"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::UserRolesItem.from_json(json_object: v)
        end
        avatar = struct["avatar"]
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          email_address: email_address,
          is_active: is_active,
          teams: teams,
          roles: roles,
          avatar: avatar,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of User to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.is_active&.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.teams&.is_a?(Array) != false || raise("Passed value for field obj.teams is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.avatar&.is_a?(String) != false || raise("Passed value for field obj.avatar is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
