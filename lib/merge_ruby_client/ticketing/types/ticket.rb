# frozen_string_literal: true

require "date"
require_relative "ticket_assignees_item"
require_relative "ticket_creator"
require_relative "ticket_status_enum"
require_relative "ticket_collections_item"
require_relative "ticket_account"
require_relative "ticket_contact"
require_relative "ticket_parent_ticket"
require_relative "ticket_attachments_item"
require_relative "priority_enum"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Ticket Object
    #  ### Description
    #  The `Ticket` object is used to represent a ticket or a task within a system.
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
      # @return [Array<Merge::Ticketing::TicketAssigneesItem>]
      attr_reader :assignees
      # @return [Merge::Ticketing::TicketCreator] The user who created this ticket.
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
      # @return [Array<Merge::Ticketing::TicketCollectionsItem>]
      attr_reader :collections
      # @return [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      attr_reader :ticket_type
      # @return [Merge::Ticketing::TicketAccount] The account associated with the ticket.
      attr_reader :account
      # @return [Merge::Ticketing::TicketContact] The contact associated with the ticket.
      attr_reader :contact
      # @return [Merge::Ticketing::TicketParentTicket] The ticket's parent ticket.
      attr_reader :parent_ticket
      # @return [Array<Merge::Ticketing::TicketAttachmentsItem>]
      attr_reader :attachments
      # @return [Array<String>]
      attr_reader :tags
      # @return [DateTime] When the third party's ticket was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's ticket was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the ticket was completed.
      attr_reader :completed_at
      # @return [Boolean]
      attr_reader :remote_was_deleted
      # @return [String] The 3rd party url of the Ticket.
      attr_reader :ticket_url
      # @return [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      attr_reader :priority
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
      # @param assignees [Array<Merge::Ticketing::TicketAssigneesItem>]
      # @param creator [Merge::Ticketing::TicketCreator] The user who created this ticket.
      # @param due_date [DateTime] The ticket's due date.
      # @param status [Merge::Ticketing::TicketStatusEnum] The current status of the ticket.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `IN_PROGRESS` - IN_PROGRESS
      #  - `ON_HOLD` - ON_HOLD
      # @param description [String] The ticket’s description. HTML version of description is mapped if supported by
      #  the third-party platform.
      # @param collections [Array<Merge::Ticketing::TicketCollectionsItem>]
      # @param ticket_type [String] The sub category of the ticket within the 3rd party system. Examples include
      #  incident, task, subtask or to-do.
      # @param account [Merge::Ticketing::TicketAccount] The account associated with the ticket.
      # @param contact [Merge::Ticketing::TicketContact] The contact associated with the ticket.
      # @param parent_ticket [Merge::Ticketing::TicketParentTicket] The ticket's parent ticket.
      # @param attachments [Array<Merge::Ticketing::TicketAttachmentsItem>]
      # @param tags [Array<String>]
      # @param remote_created_at [DateTime] When the third party's ticket was created.
      # @param remote_updated_at [DateTime] When the third party's ticket was updated.
      # @param completed_at [DateTime] When the ticket was completed.
      # @param remote_was_deleted [Boolean]
      # @param ticket_url [String] The 3rd party url of the Ticket.
      # @param priority [Merge::Ticketing::PriorityEnum] The priority or urgency of the Ticket.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param remote_fields [Array<Merge::Ticketing::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Ticket]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, assignees: OMIT,
                     creator: OMIT, due_date: OMIT, status: OMIT, description: OMIT, collections: OMIT, ticket_type: OMIT, account: OMIT, contact: OMIT, parent_ticket: OMIT, attachments: OMIT, tags: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, completed_at: OMIT, remote_was_deleted: OMIT, ticket_url: OMIT, priority: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @assignees = assignees if assignees != OMIT
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
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @completed_at = completed_at if completed_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @ticket_url = ticket_url if ticket_url != OMIT
        @priority = priority if priority != OMIT
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
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "completed_at": completed_at,
          "remote_was_deleted": remote_was_deleted,
          "ticket_url": ticket_url,
          "priority": priority,
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
        assignees = parsed_json["assignees"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketAssigneesItem.from_json(json_object: item)
        end
        if parsed_json["creator"].nil?
          creator = nil
        else
          creator = parsed_json["creator"].to_json
          creator = Merge::Ticketing::TicketCreator.from_json(json_object: creator)
        end
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = parsed_json["status"]
        description = parsed_json["description"]
        collections = parsed_json["collections"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketCollectionsItem.from_json(json_object: item)
        end
        ticket_type = parsed_json["ticket_type"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Ticketing::TicketAccount.from_json(json_object: account)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Ticketing::TicketContact.from_json(json_object: contact)
        end
        if parsed_json["parent_ticket"].nil?
          parent_ticket = nil
        else
          parent_ticket = parsed_json["parent_ticket"].to_json
          parent_ticket = Merge::Ticketing::TicketParentTicket.from_json(json_object: parent_ticket)
        end
        attachments = parsed_json["attachments"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::TicketAttachmentsItem.from_json(json_object: item)
        end
        tags = parsed_json["tags"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        completed_at = (DateTime.parse(parsed_json["completed_at"]) unless parsed_json["completed_at"].nil?)
        remote_was_deleted = parsed_json["remote_was_deleted"]
        ticket_url = parsed_json["ticket_url"]
        priority = parsed_json["priority"]
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
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          completed_at: completed_at,
          remote_was_deleted: remote_was_deleted,
          ticket_url: ticket_url,
          priority: priority,
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
        obj.creator.nil? || Merge::Ticketing::TicketCreator.validate_raw(obj: obj.creator)
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ticketing::TicketStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collections&.is_a?(Array) != false || raise("Passed value for field obj.collections is not the expected type, validation failed.")
        obj.ticket_type&.is_a?(String) != false || raise("Passed value for field obj.ticket_type is not the expected type, validation failed.")
        obj.account.nil? || Merge::Ticketing::TicketAccount.validate_raw(obj: obj.account)
        obj.contact.nil? || Merge::Ticketing::TicketContact.validate_raw(obj: obj.contact)
        obj.parent_ticket.nil? || Merge::Ticketing::TicketParentTicket.validate_raw(obj: obj.parent_ticket)
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.completed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.ticket_url&.is_a?(String) != false || raise("Passed value for field obj.ticket_url is not the expected type, validation failed.")
        obj.priority&.is_a?(Merge::Ticketing::PriorityEnum) != false || raise("Passed value for field obj.priority is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
