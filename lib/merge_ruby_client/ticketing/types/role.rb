# frozen_string_literal: true

require_relative "role_ticket_actions_item"
require_relative "role_ticket_access"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ticketing
    # # The Role Object
    #
    # ### Description
    #
    # The `Role` object is used to represent the set of actions & access that a user with this role is allowed to perform.
    #
    # ### Usage Example
    #
    # TODO
    class Role
      attr_reader :id, :remote_id, :name, :ticket_actions, :ticket_access, :remote_was_deleted, :created_at,
                  :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The name of the Role.
      # @param ticket_actions [Array<Ticketing::RoleTicketActionsItem>] The set of actions that a User with this Role can perform. Possible enum values include: `VIEW`, `CREATE`, `EDIT`, `DELETE`, `CLOSE`, and `ASSIGN`.
      # @param ticket_access [Ticketing::RoleTicketAccess] The level of Ticket access that a User with this Role can perform.
      #   - `ALL` - ALL
      #   - `ASSIGNED_ONLY` - ASSIGNED_ONLY
      #   - `TEAM_ONLY` - TEAM_ONLY
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::Role]
      def initialize(id: nil, remote_id: nil, name: nil, ticket_actions: nil, ticket_access: nil,
                     remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The name of the Role.
        @name = name
        # @type [Array<Ticketing::RoleTicketActionsItem>] The set of actions that a User with this Role can perform. Possible enum values include: `VIEW`, `CREATE`, `EDIT`, `DELETE`, `CLOSE`, and `ASSIGN`.
        @ticket_actions = ticket_actions
        # @type [Ticketing::RoleTicketAccess] The level of Ticket access that a User with this Role can perform.
        #   - `ALL` - ALL
        #   - `ASSIGNED_ONLY` - ASSIGNED_ONLY
        #   - `TEAM_ONLY` - TEAM_ONLY
        @ticket_access = ticket_access
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

      # Deserialize a JSON object to an instance of Role
      #
      # @param json_object [JSON]
      # @return [Ticketing::Role]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        ticket_actions = parsed_json["ticket_actions"]&.map do |v|
          v = v.to_json
          Ticketing::RoleTicketActionsItem.from_json(json_object: v)
        end
        if parsed_json["ticket_access"].nil?
          ticket_access = nil
        else
          ticket_access = parsed_json["ticket_access"].to_json
          ticket_access = Ticketing::RoleTicketAccess.from_json(json_object: ticket_access)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ticketing::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, ticket_actions: ticket_actions, ticket_access: ticket_access,
            remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Role to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "ticket_actions": @ticket_actions,
          "ticket_access": @ticket_access,
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.ticket_actions&.is_a?(Array) != false || raise("Passed value for field obj.ticket_actions is not the expected type, validation failed.")
        obj.ticket_access.nil? || Ticketing::RoleTicketAccess.validate_raw(obj: obj.ticket_access)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
