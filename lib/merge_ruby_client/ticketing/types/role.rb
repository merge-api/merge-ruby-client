# frozen_string_literal: true

require "date"
require_relative "ticket_actions_enum"
require_relative "ticket_access_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Role Object
    #  ### Description
    #  The `Role` object is used to represent the set of actions & access that a user
    #  with this role is allowed to perform.
    #  ### Usage Example
    #  TODO
    class Role
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The name of the Role.
      attr_reader :name
      # @return [Array<Merge::Ticketing::TicketActionsEnum>] The set of actions that a User with this Role can perform. Possible enum values
      #  include: `VIEW`, `CREATE`, `EDIT`, `DELETE`, `CLOSE`, and `ASSIGN`.
      attr_reader :ticket_actions
      # @return [Merge::Ticketing::TicketAccessEnum] The level of Ticket access that a User with this Role can perform.
      #  - `ALL` - ALL
      #  - `ASSIGNED_ONLY` - ASSIGNED_ONLY
      #  - `TEAM_ONLY` - TEAM_ONLY
      attr_reader :ticket_access
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
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
      # @param name [String] The name of the Role.
      # @param ticket_actions [Array<Merge::Ticketing::TicketActionsEnum>] The set of actions that a User with this Role can perform. Possible enum values
      #  include: `VIEW`, `CREATE`, `EDIT`, `DELETE`, `CLOSE`, and `ASSIGN`.
      # @param ticket_access [Merge::Ticketing::TicketAccessEnum] The level of Ticket access that a User with this Role can perform.
      #  - `ALL` - ALL
      #  - `ASSIGNED_ONLY` - ASSIGNED_ONLY
      #  - `TEAM_ONLY` - TEAM_ONLY
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Role]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, ticket_actions: OMIT,
                     ticket_access: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @ticket_actions = ticket_actions if ticket_actions != OMIT
        @ticket_access = ticket_access if ticket_access != OMIT
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
          "ticket_actions": ticket_actions,
          "ticket_access": ticket_access,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Role
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Role]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        ticket_actions = parsed_json["ticket_actions"]
        ticket_access = parsed_json["ticket_access"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          ticket_actions: ticket_actions,
          ticket_access: ticket_access,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Role to a JSON object
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
        obj.ticket_actions&.is_a?(Array) != false || raise("Passed value for field obj.ticket_actions is not the expected type, validation failed.")
        obj.ticket_access&.is_a?(Merge::Ticketing::TicketAccessEnum) != false || raise("Passed value for field obj.ticket_access is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
