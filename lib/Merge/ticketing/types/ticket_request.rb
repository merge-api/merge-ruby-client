# frozen_string_literal: true
require_relative "ticket_request_assignees_item"
require_relative "ticket_request_creator"
require "date"
require_relative "ticket_request_status"
require_relative "ticket_request_collections_item"
require_relative "ticket_request_account"
require_relative "ticket_request_contact"
require_relative "ticket_request_parent_ticket"
require_relative "ticket_request_attachments_item"
require "date"
require_relative "ticket_request_priority"
require_relative "remote_field_request"
require "json"

module Merge
  module Ticketing
    # # The Ticket Object 
### Description

The `Ticket` object is used to represent a ticket or a task within a system.

### Usage Example

TODO
    class TicketRequest
      attr_reader :name, :assignees, :creator, :due_date, :status, :description, :collections, :ticket_type, :account, :contact, :parent_ticket, :attachments, :tags, :completed_at, :ticket_url, :priority, :integration_params, :linked_account_params, :remote_fields, :additional_properties
      # @param name [String] The ticket's name.
      # @param assignees [Array<Ticketing::TicketRequestAssigneesItem>] 
      # @param creator [Ticketing::TicketRequestCreator] The user who created this ticket.
      # @param due_date [DateTime] The ticket's due date.
      # @param status [Ticketing::TicketRequestStatus] The current status of the ticket.  - `OPEN` - OPEN
- `CLOSED` - CLOSED
- `IN_PROGRESS` - IN_PROGRESS
- `ON_HOLD` - ON_HOLD
      # @param description [String] The ticket’s description. HTML version of description is mapped if supported by the third-party platform.
      # @param collections [Array<Ticketing::TicketRequestCollectionsItem>] 
      # @param ticket_type [String] The ticket's type.
      # @param account [Ticketing::TicketRequestAccount] The account associated with the ticket.
      # @param contact [Ticketing::TicketRequestContact] The contact associated with the ticket.
      # @param parent_ticket [Ticketing::TicketRequestParentTicket] The ticket's parent ticket.
      # @param attachments [Array<Ticketing::TicketRequestAttachmentsItem>] 
      # @param tags [Array<String>] 
      # @param completed_at [DateTime] When the ticket was completed.
      # @param ticket_url [String] The 3rd party url of the Ticket.
      # @param priority [Ticketing::TicketRequestPriority] The priority or urgency of the Ticket.  - `URGENT` - URGENT
- `HIGH` - HIGH
- `NORMAL` - NORMAL
- `LOW` - LOW
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param remote_fields [Array<Ticketing::RemoteFieldRequest>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::TicketRequest]
      def initialize(name: nil, assignees: nil, creator: nil, due_date: nil, status: nil, description: nil, collections: nil, ticket_type: nil, account: nil, contact: nil, parent_ticket: nil, attachments: nil, tags: nil, completed_at: nil, ticket_url: nil, priority: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The ticket's name.
        @name = name
        # @type [Array<Ticketing::TicketRequestAssigneesItem>] 
        @assignees = assignees
        # @type [Ticketing::TicketRequestCreator] The user who created this ticket.
        @creator = creator
        # @type [DateTime] The ticket's due date.
        @due_date = due_date
        # @type [Ticketing::TicketRequestStatus] The current status of the ticket. 
- `OPEN` - OPEN
- `CLOSED` - CLOSED
- `IN_PROGRESS` - IN_PROGRESS
- `ON_HOLD` - ON_HOLD
        @status = status
        # @type [String] The ticket’s description. HTML version of description is mapped if supported by the third-party platform.
        @description = description
        # @type [Array<Ticketing::TicketRequestCollectionsItem>] 
        @collections = collections
        # @type [String] The ticket's type.
        @ticket_type = ticket_type
        # @type [Ticketing::TicketRequestAccount] The account associated with the ticket.
        @account = account
        # @type [Ticketing::TicketRequestContact] The contact associated with the ticket.
        @contact = contact
        # @type [Ticketing::TicketRequestParentTicket] The ticket's parent ticket.
        @parent_ticket = parent_ticket
        # @type [Array<Ticketing::TicketRequestAttachmentsItem>] 
        @attachments = attachments
        # @type [Array<String>] 
        @tags = tags
        # @type [DateTime] When the ticket was completed.
        @completed_at = completed_at
        # @type [String] The 3rd party url of the Ticket.
        @ticket_url = ticket_url
        # @type [Ticketing::TicketRequestPriority] The priority or urgency of the Ticket. 
- `URGENT` - URGENT
- `HIGH` - HIGH
- `NORMAL` - NORMAL
- `LOW` - LOW
        @priority = priority
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [Array<Ticketing::RemoteFieldRequest>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of TicketRequest
      #
      # @param json_object [JSON] 
      # @return [Ticketing::TicketRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        assignees = struct.assignees.map() do | v |
  v = v.to_h.to_json()
  Ticketing::TicketRequestAssigneesItem.from_json(json_object: v)
end
        creator = struct.creator.to_h.to_json()
        creator = Ticketing::TicketRequestCreator.from_json(json_object: creator)
        due_date = DateTime.parse(struct.due_date)
        status = struct.status.to_h.to_json()
        status = Ticketing::TicketRequestStatus.from_json(json_object: status)
        description = struct.description
        collections = struct.collections.map() do | v |
  v = v.to_h.to_json()
  Ticketing::TicketRequestCollectionsItem.from_json(json_object: v)
end
        ticket_type = struct.ticket_type
        account = struct.account.to_h.to_json()
        account = Ticketing::TicketRequestAccount.from_json(json_object: account)
        contact = struct.contact.to_h.to_json()
        contact = Ticketing::TicketRequestContact.from_json(json_object: contact)
        parent_ticket = struct.parent_ticket.to_h.to_json()
        parent_ticket = Ticketing::TicketRequestParentTicket.from_json(json_object: parent_ticket)
        attachments = struct.attachments.map() do | v |
  v = v.to_h.to_json()
  Ticketing::TicketRequestAttachmentsItem.from_json(json_object: v)
end
        tags = struct.tags
        completed_at = DateTime.parse(struct.completed_at)
        ticket_url = struct.ticket_url
        priority = struct.priority.to_h.to_json()
        priority = Ticketing::TicketRequestPriority.from_json(json_object: priority)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Ticketing::RemoteFieldRequest.from_json(json_object: v)
end
        new(name: name, assignees: assignees, creator: creator, due_date: due_date, status: status, description: description, collections: collections, ticket_type: ticket_type, account: account, contact: contact, parent_ticket: parent_ticket, attachments: attachments, tags: tags, completed_at: completed_at, ticket_url: ticket_url, priority: priority, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of TicketRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "assignees": @assignees, "creator": @creator, "due_date": @due_date, "status": @status, "description": @description, "collections": @collections, "ticket_type": @ticket_type, "account": @account, "contact": @contact, "parent_ticket": @parent_ticket, "attachments": @attachments, "tags": @tags, "completed_at": @completed_at, "ticket_url": @ticket_url, "priority": @priority, "integration_params": @integration_params, "linked_account_params": @linked_account_params, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.assignees&.is_a?(Array) != false || raise("Passed value for field obj.assignees is not the expected type, validation failed.")
        obj.creator.nil?() || Ticketing::TicketRequestCreator.validate_raw(obj: obj.creator)
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status.nil?() || Ticketing::TicketRequestStatus.validate_raw(obj: obj.status)
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collections&.is_a?(Array) != false || raise("Passed value for field obj.collections is not the expected type, validation failed.")
        obj.ticket_type&.is_a?(String) != false || raise("Passed value for field obj.ticket_type is not the expected type, validation failed.")
        obj.account.nil?() || Ticketing::TicketRequestAccount.validate_raw(obj: obj.account)
        obj.contact.nil?() || Ticketing::TicketRequestContact.validate_raw(obj: obj.contact)
        obj.parent_ticket.nil?() || Ticketing::TicketRequestParentTicket.validate_raw(obj: obj.parent_ticket)
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.completed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
        obj.ticket_url&.is_a?(String) != false || raise("Passed value for field obj.ticket_url is not the expected type, validation failed.")
        obj.priority.nil?() || Ticketing::TicketRequestPriority.validate_raw(obj: obj.priority)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end