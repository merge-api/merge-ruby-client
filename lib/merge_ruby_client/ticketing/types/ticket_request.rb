# frozen_string_literal: true

require_relative "ticket_request_assignees_item"
require_relative "ticket_request_assigned_teams_item"
require_relative "ticket_request_creator"
require "date"
require_relative "ticket_status_enum"
require_relative "ticket_request_collections_item"
require_relative "ticket_request_account"
require_relative "ticket_request_contact"
require_relative "ticket_request_parent_ticket"
require_relative "ticket_request_attachments_item"
require_relative "priority_enum"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Ticket Object
    #  ### Description
    #  The `Ticket` object is used to represent a ticket, issue, task or case.
    #  ### Usage Example
    #  TODO
    class TicketRequest
      # @return [String] The ticket's name.
      attr_reader :name
      # @return [Array<Merge::Ticketing::TicketRequestAssigneesItem>] The individual `Users` who are assigned to this ticket. This does not include
      #  `Users` who just have view access to this ticket.
      attr_reader :assignees
      # @return [Array<Merge::Ticketing::TicketRequestAssignedTeamsItem>] The `Teams` that are assigned to this ticket. This does not include `Teams` who
      #  just have view access to this ticket.
      attr_reader :assigned_teams
      # @return [Merge::Ticketing::TicketRequestCreator] The user who created this ticket.
      attr_reader :creator
      # @return [DateTime] The ticket's due date.
      attr_reader :due_date
      # @return [Merge::Ticketing::TicketStatusEnum] The current status of the ticket.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `IN_PROGRESS` - IN_PROGRESS
      #  - `ON_HOLD` - ON_HOLD
      attr_reader :status
      # @return [String] The ticket’s description. HTML version of description is mapped if supported by
      #  the third-party platform.
      attr_reader :description
      # @return [Array<Merge::Ticketing::TicketRequestCollectionsItem>] The `Collections` that this `Ticket` is included in.
      attr_reader :collections
      # @return [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      attr_reader :ticket_type
      # @return [Merge::Ticketing::TicketRequestAccount] The account associated with the ticket.
      attr_reader :account
      # @return [Merge::Ticketing::TicketRequestContact] The contact associated with the ticket.
      attr_reader :contact
      # @return [Merge::Ticketing::TicketRequestParentTicket] The ticket's parent ticket.
      attr_reader :parent_ticket
      # @return [Array<Merge::Ticketing::TicketRequestAttachmentsItem>]
      attr_reader :attachments
      # @return [Array<String>]
      attr_reader :tags
      # @return [Array<String>]
      attr_reader :roles
      # @return [DateTime] When the ticket was completed.
      attr_reader :completed_at
      # @return [String] The 3rd party url of the Ticket.
      attr_reader :ticket_url
      # @return [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      attr_reader :priority
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Ticketing::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] The ticket's name.
      # @param assignees [Array<Merge::Ticketing::TicketRequestAssigneesItem>] The individual `Users` who are assigned to this ticket. This does not include
      #  `Users` who just have view access to this ticket.
      # @param assigned_teams [Array<Merge::Ticketing::TicketRequestAssignedTeamsItem>] The `Teams` that are assigned to this ticket. This does not include `Teams` who
      #  just have view access to this ticket.
      # @param creator [Merge::Ticketing::TicketRequestCreator] The user who created this ticket.
      # @param due_date [DateTime] The ticket's due date.
      # @param status [Merge::Ticketing::TicketStatusEnum] The current status of the ticket.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `IN_PROGRESS` - IN_PROGRESS
      #  - `ON_HOLD` - ON_HOLD
      # @param description [String] The ticket’s description. HTML version of description is mapped if supported by
      #  the third-party platform.
      # @param collections [Array<Merge::Ticketing::TicketRequestCollectionsItem>] The `Collections` that this `Ticket` is included in.
      # @param ticket_type [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      # @param account [Merge::Ticketing::TicketRequestAccount] The account associated with the ticket.
      # @param contact [Merge::Ticketing::TicketRequestContact] The contact associated with the ticket.
      # @param parent_ticket [Merge::Ticketing::TicketRequestParentTicket] The ticket's parent ticket.
      # @param attachments [Array<Merge::Ticketing::TicketRequestAttachmentsItem>]
      # @param tags [Array<String>]
      # @param roles [Array<String>]
      # @param completed_at [DateTime] When the ticket was completed.
      # @param ticket_url [String] The 3rd party url of the Ticket.
      # @param priority [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Ticketing::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::TicketRequest]
      def initialize(name: OMIT, assignees: OMIT, assigned_teams: OMIT, creator: OMIT, due_date: OMIT, status: OMIT,
                     description: OMIT, collections: OMIT, ticket_type: OMIT, account: OMIT, contact: OMIT, parent_ticket: OMIT, attachments: OMIT, tags: OMIT, roles: OMIT, completed_at: OMIT, ticket_url: OMIT, priority: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
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
        @tags = tags if tags != OMIT
        @roles = roles if roles != OMIT
        @completed_at = completed_at if completed_at != OMIT
        @ticket_url = ticket_url if ticket_url != OMIT
        @priority = priority if priority != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
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
          "tags": tags,
          "roles": roles,
          "completed_at": completed_at,
          "ticket_url": ticket_url,
          "priority": priority,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TicketRequest
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::TicketRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        assignees = parsed_json["assignees"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketRequestAssigneesItem.from_json(json_object: item)
        end
        assigned_teams = parsed_json["assigned_teams"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketRequestAssignedTeamsItem.from_json(json_object: item)
        end
        if parsed_json["creator"].nil?
          creator = nil
        else
          creator = parsed_json["creator"].to_json
          creator = Merge::Ticketing::TicketRequestCreator.from_json(json_object: creator)
        end
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = parsed_json["status"]
        description = parsed_json["description"]
        collections = parsed_json["collections"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketRequestCollectionsItem.from_json(json_object: item)
        end
        ticket_type = parsed_json["ticket_type"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Ticketing::TicketRequestAccount.from_json(json_object: account)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Ticketing::TicketRequestContact.from_json(json_object: contact)
        end
        if parsed_json["parent_ticket"].nil?
          parent_ticket = nil
        else
          parent_ticket = parsed_json["parent_ticket"].to_json
          parent_ticket = Merge::Ticketing::TicketRequestParentTicket.from_json(json_object: parent_ticket)
        end
        attachments = parsed_json["attachments"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketRequestAttachmentsItem.from_json(json_object: item)
        end
        tags = parsed_json["tags"]
        roles = parsed_json["roles"]
        completed_at = (DateTime.parse(parsed_json["completed_at"]) unless parsed_json["completed_at"].nil?)
        ticket_url = parsed_json["ticket_url"]
        priority = parsed_json["priority"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
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
          tags: tags,
          roles: roles,
          completed_at: completed_at,
          ticket_url: ticket_url,
          priority: priority,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of TicketRequest to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.assignees&.is_a?(Array) != false || raise("Passed value for field obj.assignees is not the expected type, validation failed.")
        obj.assigned_teams&.is_a?(Array) != false || raise("Passed value for field obj.assigned_teams is not the expected type, validation failed.")
        obj.creator.nil? || Merge::Ticketing::TicketRequestCreator.validate_raw(obj: obj.creator)
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ticketing::TicketStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collections&.is_a?(Array) != false || raise("Passed value for field obj.collections is not the expected type, validation failed.")
        obj.ticket_type&.is_a?(String) != false || raise("Passed value for field obj.ticket_type is not the expected type, validation failed.")
        obj.account.nil? || Merge::Ticketing::TicketRequestAccount.validate_raw(obj: obj.account)
        obj.contact.nil? || Merge::Ticketing::TicketRequestContact.validate_raw(obj: obj.contact)
        obj.parent_ticket.nil? || Merge::Ticketing::TicketRequestParentTicket.validate_raw(obj: obj.parent_ticket)
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.roles&.is_a?(Array) != false || raise("Passed value for field obj.roles is not the expected type, validation failed.")
        obj.completed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
        obj.ticket_url&.is_a?(String) != false || raise("Passed value for field obj.ticket_url is not the expected type, validation failed.")
        obj.priority&.is_a?(Merge::Ticketing::PriorityEnum) != false || raise("Passed value for field obj.priority is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
