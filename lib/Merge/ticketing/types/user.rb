# frozen_string_literal: true
require_relative "user_teams_item"
require_relative "user_roles_item"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ticketing
    # # The User Object 
### Description

The `User` object is used to represent an employee within a company.

### Usage Example

TODO
    class User
      attr_reader :id, :remote_id, :name, :email_address, :is_active, :teams, :roles, :avatar, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The user's name.
      # @param email_address [String] The user's email address.
      # @param is_active [Boolean] Whether or not the user is active.
      # @param teams [Array<Ticketing::UserTeamsItem>] 
      # @param roles [Array<Ticketing::UserRolesItem>] 
      # @param avatar [String] The user's avatar picture.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ticketing::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::User]
      def initialize(id: nil, remote_id: nil, name: nil, email_address: nil, is_active: nil, teams: nil, roles: nil, avatar: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The user's name.
        @name = name
        # @type [String] The user's email address.
        @email_address = email_address
        # @type [Boolean] Whether or not the user is active.
        @is_active = is_active
        # @type [Array<Ticketing::UserTeamsItem>] 
        @teams = teams
        # @type [Array<Ticketing::UserRolesItem>] 
        @roles = roles
        # @type [String] The user's avatar picture.
        @avatar = avatar
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Ticketing::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of User
      #
      # @param json_object [JSON] 
      # @return [Ticketing::User]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        email_address = struct.email_address
        is_active = struct.is_active
        teams = struct.teams.map() do | v |
  v = v.to_h.to_json()
  Ticketing::UserTeamsItem.from_json(json_object: v)
end
        roles = struct.roles.map() do | v |
  v = v.to_h.to_json()
  Ticketing::UserRolesItem.from_json(json_object: v)
end
        avatar = struct.avatar
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ticketing::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, name: name, email_address: email_address, is_active: is_active, teams: teams, roles: roles, avatar: avatar, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of User to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "name": @name, "email_address": @email_address, "is_active": @is_active, "teams": @teams, "roles": @roles, "avatar": @avatar, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.is_active&.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.teams&.is_a?(Array) != false || raise("Passed value for field obj.teams is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.avatar&.is_a?(String) != false || raise("Passed value for field obj.avatar is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end