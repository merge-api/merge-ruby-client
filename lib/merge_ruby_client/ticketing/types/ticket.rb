# frozen_string_literal: true

require_relative "ticket_assignees_item"
require_relative "ticket_creator"
require "date"
require_relative "ticket_status_enum"
require_relative "ticket_collections_item"
require_relative "ticket_account"
require_relative "ticket_contact"
require_relative "ticket_parent_ticket"
require_relative "ticket_attachments_item"
require_relative "priority_enum"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Ticketing
    # # The Ticket Object
    #
    # ### Description
    #
    # The `Ticket` object is used to represent a ticket or a task within a system.
    #
    # ### Usage Example
    #
    # TODO
    class Ticket
      attr_reader :id, :remote_id, :name, :assignees, :creator, :due_date, :status, :description, :collections,
                  :ticket_type, :account, :contact, :parent_ticket, :attachments, :tags, :remote_created_at, :remote_updated_at, :completed_at, :remote_was_deleted, :ticket_url, :priority, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The ticket's name.
      # @param assignees [Array<Ticketing::TicketAssigneesItem>]
      # @param creator [Ticketing::TicketCreator] The user who created this ticket.
      # @param due_date [DateTime] The ticket's due date.
      # @param status [TICKET_STATUS_ENUM] The current status of the ticket.
      #   - `OPEN` - OPEN
      #   - `CLOSED` - CLOSED
      #   - `IN_PROGRESS` - IN_PROGRESS
      #   - `ON_HOLD` - ON_HOLD
      # @param description [String] The ticket’s description. HTML version of description is mapped if supported by the third-party platform.
      # @param collections [Array<Ticketing::TicketCollectionsItem>]
      # @param ticket_type [String] The ticket's type.
      # @param account [Ticketing::TicketAccount] The account associated with the ticket.
      # @param contact [Ticketing::TicketContact] The contact associated with the ticket.
      # @param parent_ticket [Ticketing::TicketParentTicket] The ticket's parent ticket.
      # @param attachments [Array<Ticketing::TicketAttachmentsItem>]
      # @param tags [Array<String>]
      # @param remote_created_at [DateTime] When the third party's ticket was created.
      # @param remote_updated_at [DateTime] When the third party's ticket was updated.
      # @param completed_at [DateTime] When the ticket was completed.
      # @param remote_was_deleted [Boolean]
      # @param ticket_url [String] The 3rd party url of the Ticket.
      # @param priority [PRIORITY_ENUM] The priority or urgency of the Ticket.
      #   - `URGENT` - URGENT
      #   - `HIGH` - HIGH
      #   - `NORMAL` - NORMAL
      #   - `LOW` - LOW
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ticketing::RemoteData>]
      # @param remote_fields [Array<Ticketing::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::Ticket]
      def initialize(id: nil, remote_id: nil, name: nil, assignees: nil, creator: nil, due_date: nil, status: nil,
                     description: nil, collections: nil, ticket_type: nil, account: nil, contact: nil, parent_ticket: nil, attachments: nil, tags: nil, remote_created_at: nil, remote_updated_at: nil, completed_at: nil, remote_was_deleted: nil, ticket_url: nil, priority: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The ticket's name.
        @name = name
        # @type [Array<Ticketing::TicketAssigneesItem>]
        @assignees = assignees
        # @type [Ticketing::TicketCreator] The user who created this ticket.
        @creator = creator
        # @type [DateTime] The ticket's due date.
        @due_date = due_date
        # @type [TICKET_STATUS_ENUM] The current status of the ticket.
        #   - `OPEN` - OPEN
        #   - `CLOSED` - CLOSED
        #   - `IN_PROGRESS` - IN_PROGRESS
        #   - `ON_HOLD` - ON_HOLD
        @status = status
        # @type [String] The ticket’s description. HTML version of description is mapped if supported by the third-party platform.
        @description = description
        # @type [Array<Ticketing::TicketCollectionsItem>]
        @collections = collections
        # @type [String] The ticket's type.
        @ticket_type = ticket_type
        # @type [Ticketing::TicketAccount] The account associated with the ticket.
        @account = account
        # @type [Ticketing::TicketContact] The contact associated with the ticket.
        @contact = contact
        # @type [Ticketing::TicketParentTicket] The ticket's parent ticket.
        @parent_ticket = parent_ticket
        # @type [Array<Ticketing::TicketAttachmentsItem>]
        @attachments = attachments
        # @type [Array<String>]
        @tags = tags
        # @type [DateTime] When the third party's ticket was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's ticket was updated.
        @remote_updated_at = remote_updated_at
        # @type [DateTime] When the ticket was completed.
        @completed_at = completed_at
        # @type [Boolean]
        @remote_was_deleted = remote_was_deleted
        # @type [String] The 3rd party url of the Ticket.
        @ticket_url = ticket_url
        # @type [PRIORITY_ENUM] The priority or urgency of the Ticket.
        #   - `URGENT` - URGENT
        #   - `HIGH` - HIGH
        #   - `NORMAL` - NORMAL
        #   - `LOW` - LOW
        @priority = priority
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Ticketing::RemoteData>]
        @remote_data = remote_data
        # @type [Array<Ticketing::RemoteField>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Ticket
      #
      # @param json_object [JSON]
      # @return [Ticketing::Ticket]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        assignees = parsed_json["assignees"]&.map do |v|
          v = v.to_json
          Ticketing::TicketAssigneesItem.from_json(json_object: v)
        end
        if parsed_json["creator"].nil?
          creator = nil
        else
          creator = parsed_json["creator"].to_json
          creator = Ticketing::TicketCreator.from_json(json_object: creator)
        end
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = Ticketing::TICKET_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        description = struct.description
        collections = parsed_json["collections"]&.map do |v|
          v = v.to_json
          Ticketing::TicketCollectionsItem.from_json(json_object: v)
        end
        ticket_type = struct.ticket_type
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Ticketing::TicketAccount.from_json(json_object: account)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Ticketing::TicketContact.from_json(json_object: contact)
        end
        if parsed_json["parent_ticket"].nil?
          parent_ticket = nil
        else
          parent_ticket = parsed_json["parent_ticket"].to_json
          parent_ticket = Ticketing::TicketParentTicket.from_json(json_object: parent_ticket)
        end
        attachments = parsed_json["attachments"]&.map do |v|
          v = v.to_json
          Ticketing::TicketAttachmentsItem.from_json(json_object: v)
        end
        tags = struct.tags
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        completed_at = (DateTime.parse(parsed_json["completed_at"]) unless parsed_json["completed_at"].nil?)
        remote_was_deleted = struct.remote_was_deleted
        ticket_url = struct.ticket_url
        priority = Ticketing::PRIORITY_ENUM.key(parsed_json["priority"]) || parsed_json["priority"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ticketing::RemoteData.from_json(json_object: v)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Ticketing::RemoteField.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, assignees: assignees, creator: creator, due_date: due_date,
            status: status, description: description, collections: collections, ticket_type: ticket_type, account: account, contact: contact, parent_ticket: parent_ticket, attachments: attachments, tags: tags, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, completed_at: completed_at, remote_was_deleted: remote_was_deleted, ticket_url: ticket_url, priority: priority, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of Ticket to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "assignees": @assignees,
          "creator": @creator,
          "due_date": @due_date,
          "status": Ticketing::TICKET_STATUS_ENUM[@status] || @status,
          "description": @description,
          "collections": @collections,
          "ticket_type": @ticket_type,
          "account": @account,
          "contact": @contact,
          "parent_ticket": @parent_ticket,
          "attachments": @attachments,
          "tags": @tags,
          "remote_created_at": @remote_created_at,
          "remote_updated_at": @remote_updated_at,
          "completed_at": @completed_at,
          "remote_was_deleted": @remote_was_deleted,
          "ticket_url": @ticket_url,
          "priority": Ticketing::PRIORITY_ENUM[@priority] || @priority,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data,
          "remote_fields": @remote_fields
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
        obj.assignees&.is_a?(Array) != false || raise("Passed value for field obj.assignees is not the expected type, validation failed.")
        obj.creator.nil? || Ticketing::TicketCreator.validate_raw(obj: obj.creator)
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Ticketing::TICKET_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collections&.is_a?(Array) != false || raise("Passed value for field obj.collections is not the expected type, validation failed.")
        obj.ticket_type&.is_a?(String) != false || raise("Passed value for field obj.ticket_type is not the expected type, validation failed.")
        obj.account.nil? || Ticketing::TicketAccount.validate_raw(obj: obj.account)
        obj.contact.nil? || Ticketing::TicketContact.validate_raw(obj: obj.contact)
        obj.parent_ticket.nil? || Ticketing::TicketParentTicket.validate_raw(obj: obj.parent_ticket)
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.completed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.ticket_url&.is_a?(String) != false || raise("Passed value for field obj.ticket_url is not the expected type, validation failed.")
        obj.priority&.is_a?(Ticketing::PRIORITY_ENUM) != false || raise("Passed value for field obj.priority is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
