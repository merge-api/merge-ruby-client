# frozen_string_literal: true

require_relative "permission_request_user"
require_relative "permission_request_group"
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
    class PermissionRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Merge::Filestorage::PermissionRequestUser] The user that is granted this permission. This will only be populated if the
      #  type is `USER`.
      attr_reader :user
      # @return [Merge::Filestorage::PermissionRequestGroup] The group that is granted this permission. This will only be populated if the
      #  type is `GROUP`.
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

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param user [Merge::Filestorage::PermissionRequestUser] The user that is granted this permission. This will only be populated if the
      #  type is `USER`.
      # @param group [Merge::Filestorage::PermissionRequestGroup] The group that is granted this permission. This will only be populated if the
      #  type is `GROUP`.
      # @param type [Merge::Filestorage::TypeEnum] Denotes what type of people have access to the file.
      #  - `USER` - USER
      #  - `GROUP` - GROUP
      #  - `COMPANY` - COMPANY
      #  - `ANYONE` - ANYONE
      # @param roles [Array<Merge::Filestorage::RolesEnum>] The permissions that the user or group has for the File or Folder. It is
      #  possible for a user or group to have multiple roles, such as viewing &
      #  uploading. Possible values include: `READ`, `WRITE`, `OWNER`. In cases where
      #  there is no clear mapping, the original value passed through will be returned.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::PermissionRequest]
      def initialize(remote_id: OMIT, user: OMIT, group: OMIT, type: OMIT, roles: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @user = user if user != OMIT
        @group = group if group != OMIT
        @type = type if type != OMIT
        @roles = roles if roles != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "user": user,
          "group": group,
          "type": type,
          "roles": roles,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PermissionRequest
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::PermissionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Filestorage::PermissionRequestUser.from_json(json_object: user)
        end
        if parsed_json["group"].nil?
          group = nil
        else
          group = parsed_json["group"].to_json
          group = Merge::Filestorage::PermissionRequestGroup.from_json(json_object: group)
        end
        type = parsed_json["type"]
        roles = parsed_json["roles"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          remote_id: remote_id,
          user: user,
          group: group,
          type: type,
          roles: roles,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of PermissionRequest to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.user.nil? || Merge::Filestorage::PermissionRequestUser.validate_raw(obj: obj.user)
        obj.group.nil? || Merge::Filestorage::PermissionRequestGroup.validate_raw(obj: obj.group)
        obj.type&.is_a?(Merge::Filestorage::TypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
