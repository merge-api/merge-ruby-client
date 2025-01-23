# frozen_string_literal: true

require "date"
require_relative "task_owner"
require_relative "task_account"
require_relative "task_opportunity"
require_relative "task_status_enum"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Task Object
    #  ### Description
    #  The `Task` object is used to represent a task, such as a to-do item.
    #  ### Usage Example
    #  TODO
    class Task
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The task's subject.
      attr_reader :subject
      # @return [String] The task's content.
      attr_reader :content
      # @return [Merge::Crm::TaskOwner] The task's owner.
      attr_reader :owner
      # @return [Merge::Crm::TaskAccount] The task's account.
      attr_reader :account
      # @return [Merge::Crm::TaskOpportunity] The task's opportunity.
      attr_reader :opportunity
      # @return [DateTime] When the task is completed.
      attr_reader :completed_date
      # @return [DateTime] When the task is due.
      attr_reader :due_date
      # @return [Merge::Crm::TaskStatusEnum] The task's status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      attr_reader :status
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Crm::RemoteData>]
      attr_reader :remote_data
      # @return [Array<Merge::Crm::RemoteField>]
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
      # @param subject [String] The task's subject.
      # @param content [String] The task's content.
      # @param owner [Merge::Crm::TaskOwner] The task's owner.
      # @param account [Merge::Crm::TaskAccount] The task's account.
      # @param opportunity [Merge::Crm::TaskOpportunity] The task's opportunity.
      # @param completed_date [DateTime] When the task is completed.
      # @param due_date [DateTime] When the task is due.
      # @param status [Merge::Crm::TaskStatusEnum] The task's status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Task]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, subject: OMIT, content: OMIT,
                     owner: OMIT, account: OMIT, opportunity: OMIT, completed_date: OMIT, due_date: OMIT, status: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @subject = subject if subject != OMIT
        @content = content if content != OMIT
        @owner = owner if owner != OMIT
        @account = account if account != OMIT
        @opportunity = opportunity if opportunity != OMIT
        @completed_date = completed_date if completed_date != OMIT
        @due_date = due_date if due_date != OMIT
        @status = status if status != OMIT
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
          "subject": subject,
          "content": content,
          "owner": owner,
          "account": account,
          "opportunity": opportunity,
          "completed_date": completed_date,
          "due_date": due_date,
          "status": status,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Task
      #
      # @param json_object [String]
      # @return [Merge::Crm::Task]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        subject = parsed_json["subject"]
        content = parsed_json["content"]
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::TaskOwner.from_json(json_object: owner)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::TaskAccount.from_json(json_object: account)
        end
        if parsed_json["opportunity"].nil?
          opportunity = nil
        else
          opportunity = parsed_json["opportunity"].to_json
          opportunity = Merge::Crm::TaskOpportunity.from_json(json_object: opportunity)
        end
        completed_date = (DateTime.parse(parsed_json["completed_date"]) unless parsed_json["completed_date"].nil?)
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = parsed_json["status"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteData.from_json(json_object: item)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          subject: subject,
          content: content,
          owner: owner,
          account: account,
          opportunity: opportunity,
          completed_date: completed_date,
          due_date: due_date,
          status: status,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Task to a JSON object
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
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.owner.nil? || Merge::Crm::TaskOwner.validate_raw(obj: obj.owner)
        obj.account.nil? || Merge::Crm::TaskAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil? || Merge::Crm::TaskOpportunity.validate_raw(obj: obj.opportunity)
        obj.completed_date&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_date is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Crm::TaskStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
