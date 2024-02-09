# frozen_string_literal: true

require_relative "task_owner"
require_relative "task_account"
require_relative "task_opportunity"
require "date"
require_relative "task_status_enum"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Task Object
    #
    # ### Description
    #
    # The `Task` object is used to represent a task, such as a to-do item.
    #
    # ### Usage Example
    #
    # TODO
    class Task
      attr_reader :subject, :content, :owner, :account, :opportunity, :completed_date, :due_date, :status,
                  :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties

      # @param subject [String] The task's subject.
      # @param content [String] The task's content.
      # @param owner [Crm::TaskOwner] The task's owner.
      # @param account [Crm::TaskAccount] The task's account.
      # @param opportunity [Crm::TaskOpportunity] The task's opportunity.
      # @param completed_date [DateTime] When the task is completed.
      # @param due_date [DateTime] When the task is due.
      # @param status [TASK_STATUS_ENUM] The task's status.
      #   - `OPEN` - OPEN
      #   - `CLOSED` - CLOSED
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Crm::RemoteData>]
      # @param remote_fields [Array<Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Task]
      def initialize(subject: nil, content: nil, owner: nil, account: nil, opportunity: nil, completed_date: nil,
                     due_date: nil, status: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The task's subject.
        @subject = subject
        # @type [String] The task's content.
        @content = content
        # @type [Crm::TaskOwner] The task's owner.
        @owner = owner
        # @type [Crm::TaskAccount] The task's account.
        @account = account
        # @type [Crm::TaskOpportunity] The task's opportunity.
        @opportunity = opportunity
        # @type [DateTime] When the task is completed.
        @completed_date = completed_date
        # @type [DateTime] When the task is due.
        @due_date = due_date
        # @type [TASK_STATUS_ENUM] The task's status.
        #   - `OPEN` - OPEN
        #   - `CLOSED` - CLOSED
        @status = status
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Crm::RemoteData>]
        @remote_data = remote_data
        # @type [Array<Crm::RemoteField>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Task
      #
      # @param json_object [JSON]
      # @return [Crm::Task]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        subject = struct.subject
        content = struct.content
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Crm::TaskOwner.from_json(json_object: owner)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Crm::TaskAccount.from_json(json_object: account)
        end
        if parsed_json["opportunity"].nil?
          opportunity = nil
        else
          opportunity = parsed_json["opportunity"].to_json
          opportunity = Crm::TaskOpportunity.from_json(json_object: opportunity)
        end
        completed_date = (DateTime.parse(parsed_json["completed_date"]) unless parsed_json["completed_date"].nil?)
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = Crm::TASK_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        remote_id = struct.remote_id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Crm::RemoteData.from_json(json_object: v)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteField.from_json(json_object: v)
        end
        new(subject: subject, content: content, owner: owner, account: account, opportunity: opportunity,
            completed_date: completed_date, due_date: due_date, status: status, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of Task to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "subject": @subject,
          "content": @content,
          "owner": @owner,
          "account": @account,
          "opportunity": @opportunity,
          "completed_date": @completed_date,
          "due_date": @due_date,
          "status": Crm::TASK_STATUS_ENUM[@status] || @status,
          "remote_was_deleted": @remote_was_deleted,
          "id": @id,
          "remote_id": @remote_id,
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
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.owner.nil? || Crm::TaskOwner.validate_raw(obj: obj.owner)
        obj.account.nil? || Crm::TaskAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil? || Crm::TaskOpportunity.validate_raw(obj: obj.opportunity)
        obj.completed_date&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_date is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Crm::TASK_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
