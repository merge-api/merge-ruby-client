# frozen_string_literal: true

require "date"
require_relative "permission_user"
require_relative "permission_group"
require_relative "type_enum"
require_relative "roles_enum"
require "ostruct"
require "json"

module Merge
  module Filestorage
    # # The Permission Object
    #  ### Description
    #  The Permission object is used to represent a user's or group's access to a File
    #  or Folder. Permissions are unexpanded by default.
    #  ### Usage Example
    #  Fetch from the `GET Files` or `GET Folders` endpoint. Permissions are unexpanded
    #  by default. Use the query param `expand=permissions` to see more details.
    class Permission
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [Merge::Filestorage::PermissionUser] The user that is granted this permission.
      attr_reader :user
      # @return [Merge::Filestorage::PermissionGroup] The group that is granted this permission.
      attr_reader :group
      # @return [Merge::Filestorage::TypeEnum] Denotes what type of people have access to the file.
      #  - `USER` - USER
      #  - `GROUP` - GROUP
      #  - `COMPANY` - COMPANY
      #  - `ANYONE` - ANYONE
      attr_reader :type
      # @return [Array<Merge::Filestorage::RolesEnum>] The permissions that the user or group has for the File or Folder. It is
      #  possible for a user or group to have multiple roles, such as viewing &
      #  uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where
      #  there is no clear mapping, the original value passed through will be returned.
      attr_reader :roles
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
      # @param user [Merge::Filestorage::PermissionUser] The user that is granted this permission.
      # @param group [Merge::Filestorage::PermissionGroup] The group that is granted this permission.
      # @param type [Merge::Filestorage::TypeEnum] Denotes what type of people have access to the file.
      #  - `USER` - USER
      #  - `GROUP` - GROUP
      #  - `COMPANY` - COMPANY
      #  - `ANYONE` - ANYONE
      # @param roles [Array<Merge::Filestorage::RolesEnum>] The permissions that the user or group has for the File or Folder. It is
      #  possible for a user or group to have multiple roles, such as viewing &
      #  uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where
      #  there is no clear mapping, the original value passed through will be returned.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::Permission]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, user: OMIT, group: OMIT,
                     type: OMIT, roles: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @user = user if user != OMIT
        @group = group if group != OMIT
        @type = type if type != OMIT
        @roles = roles if roles != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "user": user,
          "group": group,
          "type": type,
          "roles": roles
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Permission
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::Permission]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Filestorage::PermissionUser.from_json(json_object: user)
        end
        if parsed_json["group"].nil?
          group = nil
        else
          group = parsed_json["group"].to_json
          group = Merge::Filestorage::PermissionGroup.from_json(json_object: group)
        end
        type = struct["type"]
        roles = struct["roles"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          user: user,
          group: group,
          type: type,
          roles: roles,
          additional_properties: struct
        )
      end

      # Serialize an instance of Permission to a JSON object
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
        obj.user.nil? || Merge::Filestorage::PermissionUser.validate_raw(obj: obj.user)
        obj.group.nil? || Merge::Filestorage::PermissionGroup.validate_raw(obj: obj.group)
        obj.type&.is_a?(Merge::Filestorage::TypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
      end
    end
  end
end
