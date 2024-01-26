# frozen_string_literal: true
require_relative "permission_user"
require_relative "permission_group"
require_relative "permission_type"
require_relative "permission_roles_item"
require "date"
require "date"
require "json"

module Merge
  module Filestorage
    # # The Permission Object 
### Description

The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default.

### Usage Example

Fetch from the `GET Files` or `GET Folders` endpoint. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details.
    class Permission
      attr_reader :id, :remote_id, :user, :group, :type, :roles, :created_at, :modified_at, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param user [Filestorage::PermissionUser] The user that is granted this permission.
      # @param group [Filestorage::PermissionGroup] The group that is granted this permission.
      # @param type [Filestorage::PermissionType] Denotes what type of people have access to the file.  - `USER` - USER
- `GROUP` - GROUP
- `COMPANY` - COMPANY
- `ANYONE` - ANYONE
      # @param roles [Array<Filestorage::PermissionRolesItem>] The permissions that the user or group has for the File or Folder. It is possible for a user or group to have multiple roles, such as viewing & uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where there is no clear mapping, the original value passed through will be returned.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::Permission]
      def initialize(id: nil, remote_id: nil, user: nil, group: nil, type: nil, roles: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Filestorage::PermissionUser] The user that is granted this permission.
        @user = user
        # @type [Filestorage::PermissionGroup] The group that is granted this permission.
        @group = group
        # @type [Filestorage::PermissionType] Denotes what type of people have access to the file. 
- `USER` - USER
- `GROUP` - GROUP
- `COMPANY` - COMPANY
- `ANYONE` - ANYONE
        @type = type
        # @type [Array<Filestorage::PermissionRolesItem>] The permissions that the user or group has for the File or Folder. It is possible for a user or group to have multiple roles, such as viewing & uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where there is no clear mapping, the original value passed through will be returned.
        @roles = roles
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Permission
      #
      # @param json_object [JSON] 
      # @return [Filestorage::Permission]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        user = struct.user.to_h.to_json()
        user = Filestorage::PermissionUser.from_json(json_object: user)
        group = struct.group.to_h.to_json()
        group = Filestorage::PermissionGroup.from_json(json_object: group)
        type = struct.type.to_h.to_json()
        type = Filestorage::PermissionType.from_json(json_object: type)
        roles = struct.roles.map() do | v |
  v = v.to_h.to_json()
  Filestorage::PermissionRolesItem.from_json(json_object: v)
end
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(id: id, remote_id: remote_id, user: user, group: group, type: type, roles: roles, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of Permission to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "user": @user, "group": @group, "type": @type, "roles": @roles, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.user.nil?() || Filestorage::PermissionUser.validate_raw(obj: obj.user)
        obj.group.nil?() || Filestorage::PermissionGroup.validate_raw(obj: obj.group)
        obj.type.nil?() || Filestorage::PermissionType.validate_raw(obj: obj.type)
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end