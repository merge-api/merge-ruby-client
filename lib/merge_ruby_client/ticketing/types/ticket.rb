# frozen_string_literal: true

require "date"
require_relative "ticket_status_enum"
require_relative "ticket_access_level_enum"
require_relative "priority_enum"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Ticket Object
    #  ### Description
    #  The `Ticket` object is used to represent a ticket, issue, task or case.
    #  ### Usage Example
    #  TODO
    class Ticket
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The ticket's name.
      attr_reader :name
      # @return [Array<String>] The individual `Users` who are assigned to this ticket. This does not include
      #  `Users` who just have view access to this ticket. To fetch all `Users` and
      #  `Teams` that can access the ticket, use the `GET /tickets/{ticket_id}/viewers`
      #  [endpoint](https://docs.merge.dev/ticketing/tickets/#tickets_viewers_list).
      attr_reader :assignees
      # @return [Array<String>] The `Teams` that are assigned to this ticket. This does not include `Teams` who
      #  just have view access to this ticket. To fetch all `Users` and `Teams` that can
      #  access this ticket, use the `GET /tickets/{ticket_id}/viewers`
      #  [endpoint](https://docs.merge.dev/ticketing/tickets/#tickets_viewers_list).
      attr_reader :assigned_teams
      # @return [String] The user who created this ticket.
      attr_reader :creator
      # @return [DateTime] The ticket's due date.
      attr_reader :due_date
      # @return [Merge::Ticketing::TicketStatusEnum] The current status of the ticket.
      #  * `OPEN` - OPEN
      #  * `CLOSED` - CLOSED
      #  * `IN_PROGRESS` - IN_PROGRESS
      #  * `ON_HOLD` - ON_HOLD
      attr_reader :status
      # @return [String] The ticket’s description. HTML version of description is mapped if supported by
      #  the third-party platform.
      attr_reader :description
      # @return [Array<String>] The `Collections` that this `Ticket` is included in.
      attr_reader :collections
      # @return [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      attr_reader :ticket_type
      # @return [String] The account associated with the ticket.
      attr_reader :account
      # @return [String] The contact associated with the ticket.
      attr_reader :contact
      # @return [String] The ticket's parent ticket.
      attr_reader :parent_ticket
      # @return [Array<String>]
      attr_reader :attachments
      # @return [Merge::Ticketing::TicketAccessLevelEnum] The description of who is able to access a given ticket, or where access is
      #  inherited from.
      #  * `COMPANY` - COMPANY
      #  * `PUBLIC` - PUBLIC
      #  * `PRIVATE` - PRIVATE
      #  * `COLLECTION` - COLLECTION
      attr_reader :access_level
      # @return [Array<String>]
      attr_reader :tags
      # @return [Array<String>]
      attr_reader :roles
      # @return [String] The 3rd party url of the Ticket.
      attr_reader :ticket_url
      # @return [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  * `URGENT` - URGENT
      #  * `HIGH` - HIGH
      #  * `NORMAL` - NORMAL
      #  * `LOW` - LOW
      attr_reader :priority
      # @return [DateTime] When the third party's ticket was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's ticket was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the ticket was completed.
      attr_reader :completed_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ticketing::RemoteData>]
      attr_reader :remote_data
      # @return [Array<Merge::Ticketing::RemoteField>]
      attr_reader :remote_fields
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
      # @param name [String] The ticket's name.
      # @param assignees [Array<String>] The individual `Users` who are assigned to this ticket. This does not include
      #  `Users` who just have view access to this ticket. To fetch all `Users` and
      #  `Teams` that can access the ticket, use the `GET /tickets/{ticket_id}/viewers`
      #  [endpoint](https://docs.merge.dev/ticketing/tickets/#tickets_viewers_list).
      # @param assigned_teams [Array<String>] The `Teams` that are assigned to this ticket. This does not include `Teams` who
      #  just have view access to this ticket. To fetch all `Users` and `Teams` that can
      #  access this ticket, use the `GET /tickets/{ticket_id}/viewers`
      #  [endpoint](https://docs.merge.dev/ticketing/tickets/#tickets_viewers_list).
      # @param creator [String] The user who created this ticket.
      # @param due_date [DateTime] The ticket's due date.
      # @param status [Merge::Ticketing::TicketStatusEnum] The current status of the ticket.
      #  * `OPEN` - OPEN
      #  * `CLOSED` - CLOSED
      #  * `IN_PROGRESS` - IN_PROGRESS
      #  * `ON_HOLD` - ON_HOLD
      # @param description [String] The ticket’s description. HTML version of description is mapped if supported by
      #  the third-party platform.
      # @param collections [Array<String>] The `Collections` that this `Ticket` is included in.
      # @param ticket_type [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      # @param account [String] The account associated with the ticket.
      # @param contact [String] The contact associated with the ticket.
      # @param parent_ticket [String] The ticket's parent ticket.
      # @param attachments [Array<String>]
      # @param access_level [Merge::Ticketing::TicketAccessLevelEnum] The description of who is able to access a given ticket, or where access is
      #  inherited from.
      #  * `COMPANY` - COMPANY
      #  * `PUBLIC` - PUBLIC
      #  * `PRIVATE` - PRIVATE
      #  * `COLLECTION` - COLLECTION
      # @param tags [Array<String>]
      # @param roles [Array<String>]
      # @param ticket_url [String] The 3rd party url of the Ticket.
      # @param priority [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  * `URGENT` - URGENT
      #  * `HIGH` - HIGH
      #  * `NORMAL` - NORMAL
      #  * `LOW` - LOW
      # @param remote_created_at [DateTime] When the third party's ticket was created.
      # @param remote_updated_at [DateTime] When the third party's ticket was updated.
      # @param completed_at [DateTime] When the ticket was completed.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param remote_fields [Array<Merge::Ticketing::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Ticket]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, assignees: OMIT,
                     assigned_teams: OMIT, creator: OMIT, due_date: OMIT, status: OMIT, description: OMIT, collections: OMIT, ticket_type: OMIT, account: OMIT, contact: OMIT, parent_ticket: OMIT, attachments: OMIT, access_level: OMIT, tags: OMIT, roles: OMIT, ticket_url: OMIT, priority: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, completed_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @assignees = assignees if assignees != OMIT
        @assigned_teams = assigned_teams if assigned_teams != OMIT
        @creator = creator if creator != OMIT
        @due_date = due_date if due_date != OMIT
        @status = status if status != OMIT
        @description = description if description != OMIT
        @collections = collections if collections != OMIT
        @ticket_type = ticket_type if ticket_type != OMIT
        @account = account if account != OMIT
        @contact = contact if contact != OMIT
        @parent_ticket = parent_ticket if parent_ticket != OMIT
        @attachments = attachments if attachments != OMIT
        @access_level = access_level if access_level != OMIT
        @tags = tags if tags != OMIT
        @roles = roles if roles != OMIT
        @ticket_url = ticket_url if ticket_url != OMIT
        @priority = priority if priority != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @completed_at = completed_at if completed_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "assignees": assignees,
          "assigned_teams": assigned_teams,
          "creator": creator,
          "due_date": due_date,
          "status": status,
          "description": description,
          "collections": collections,
          "ticket_type": ticket_type,
          "account": account,
          "contact": contact,
          "parent_ticket": parent_ticket,
          "attachments": attachments,
          "access_level": access_level,
          "tags": tags,
          "roles": roles,
          "ticket_url": ticket_url,
          "priority": priority,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "completed_at": completed_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Ticket
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Ticket]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        assignees = parsed_json["assignees"]
        assigned_teams = parsed_json["assigned_teams"]
        creator = parsed_json["creator"]
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = parsed_json["status"]
        description = parsed_json["description"]
        collections = parsed_json["collections"]
        ticket_type = parsed_json["ticket_type"]
        account = parsed_json["account"]
        contact = parsed_json["contact"]
        parent_ticket = parsed_json["parent_ticket"]
        attachments = parsed_json["attachments"]
        access_level = parsed_json["access_level"]
        tags = parsed_json["tags"]
        roles = parsed_json["roles"]
        ticket_url = parsed_json["ticket_url"]
        priority = parsed_json["priority"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        completed_at = (DateTime.parse(parsed_json["completed_at"]) unless parsed_json["completed_at"].nil?)
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: item)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          assignees: assignees,
          assigned_teams: assigned_teams,
          creator: creator,
          due_date: due_date,
          status: status,
          description: description,
          collections: collections,
          ticket_type: ticket_type,
          account: account,
          contact: contact,
          parent_ticket: parent_ticket,
          attachments: attachments,
          access_level: access_level,
          tags: tags,
          roles: roles,
          ticket_url: ticket_url,
          priority: priority,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          completed_at: completed_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Ticket to a JSON object
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
        obj.assignees&.is_a?(Array) != false || raise("Passed value for field obj.assignees is not the expected type, validation failed.")
        obj.assigned_teams&.is_a?(Array) != false || raise("Passed value for field obj.assigned_teams is not the expected type, validation failed.")
        obj.creator&.is_a?(String) != false || raise("Passed value for field obj.creator is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ticketing::TicketStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collections&.is_a?(Array) != false || raise("Passed value for field obj.collections is not the expected type, validation failed.")
        obj.ticket_type&.is_a?(String) != false || raise("Passed value for field obj.ticket_type is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.contact&.is_a?(String) != false || raise("Passed value for field obj.contact is not the expected type, validation failed.")
        obj.parent_ticket&.is_a?(String) != false || raise("Passed value for field obj.parent_ticket is not the expected type, validation failed.")
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.access_level&.is_a?(Merge::Ticketing::TicketAccessLevelEnum) != false || raise("Passed value for field obj.access_level is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.ticket_url&.is_a?(String) != false || raise("Passed value for field obj.ticket_url is not the expected type, validation failed.")
        obj.priority&.is_a?(Merge::Ticketing::PriorityEnum) != false || raise("Passed value for field obj.priority is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.completed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
