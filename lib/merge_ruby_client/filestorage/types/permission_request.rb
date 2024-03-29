# frozen_string_literal: true

require_relative "permission_request_user"
require_relative "permission_request_group"
require_relative "type_enum"
require_relative "roles_enum"
require "json"

module Merge
  module Filestorage
    # # The Permission Object
    #
    # ### Description
    #
    # The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default.
    #
    # ### Usage Example
    #
    # Fetch from the `GET Files` or `GET Folders` endpoint. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details.
    class PermissionRequest
      attr_reader :remote_id, :user, :group, :type, :roles, :integration_params, :linked_account_params,
                  :additional_properties

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param user [Filestorage::PermissionRequestUser] The user that is granted this permission.
      # @param group [Filestorage::PermissionRequestGroup] The group that is granted this permission.
      # @param type [TYPE_ENUM] Denotes what type of people have access to the file.
      #   - `USER` - USER
      #   - `GROUP` - GROUP
      #   - `COMPANY` - COMPANY
      #   - `ANYONE` - ANYONE
      # @param roles [Array<Filestorage::ROLES_ENUM>] The permissions that the user or group has for the File or Folder. It is possible for a user or group to have multiple roles, such as viewing & uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where there is no clear mapping, the original value passed through will be returned.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::PermissionRequest]
      def initialize(remote_id: nil, user: nil, group: nil, type: nil, roles: nil, integration_params: nil,
                     linked_account_params: nil, additional_properties: nil)
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Filestorage::PermissionRequestUser] The user that is granted this permission.
        @user = user
        # @type [Filestorage::PermissionRequestGroup] The group that is granted this permission.
        @group = group
        # @type [TYPE_ENUM] Denotes what type of people have access to the file.
        #   - `USER` - USER
        #   - `GROUP` - GROUP
        #   - `COMPANY` - COMPANY
        #   - `ANYONE` - ANYONE
        @type = type
        # @type [Array<Filestorage::ROLES_ENUM>] The permissions that the user or group has for the File or Folder. It is possible for a user or group to have multiple roles, such as viewing & uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where there is no clear mapping, the original value passed through will be returned.
        @roles = roles
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PermissionRequest
      #
      # @param json_object [JSON]
      # @return [Filestorage::PermissionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = struct.remote_id
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Filestorage::PermissionRequestUser.from_json(json_object: user)
        end
        if parsed_json["group"].nil?
          group = nil
        else
          group = parsed_json["group"].to_json
          group = Filestorage::PermissionRequestGroup.from_json(json_object: group)
        end
        type = Filestorage::TYPE_ENUM.key(parsed_json["type"]) || parsed_json["type"]
        roles = parsed_json["roles"]&.map do |v|
          v = v.to_json
          Filestorage::ROLES_ENUM.key(v) || v
        end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(remote_id: remote_id, user: user, group: group, type: type, roles: roles,
            integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of PermissionRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "remote_id": @remote_id,
          "user": @user,
          "group": @group,
          "type": Filestorage::TYPE_ENUM[@type] || @type,
          "roles": @roles,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.user.nil? || Filestorage::PermissionRequestUser.validate_raw(obj: obj.user)
        obj.group.nil? || Filestorage::PermissionRequestGroup.validate_raw(obj: obj.group)
        obj.type&.is_a?(Filestorage::TYPE_ENUM) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
