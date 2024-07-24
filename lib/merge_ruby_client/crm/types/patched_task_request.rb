# frozen_string_literal: true

require "date"
require_relative "task_status_enum"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Task Object
    #  ### Description
    #  The `Task` object is used to represent a task, such as a to-do item.
    #  ### Usage Example
    #  TODO
    class PatchedTaskRequest
      # @return [String] The task's subject.
      attr_reader :subject
      # @return [String] The task's content.
      attr_reader :content
      # @return [String] The task's owner.
      attr_reader :owner
      # @return [String] The task's account.
      attr_reader :account
      # @return [String] The task's opportunity.
      attr_reader :opportunity
      # @return [DateTime] When the task is completed.
      attr_reader :completed_date
      # @return [DateTime] When the task is due.
      attr_reader :due_date
      # @return [Merge::Crm::TaskStatusEnum] The task's status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      attr_reader :status
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Crm::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param subject [String] The task's subject.
      # @param content [String] The task's content.
      # @param owner [String] The task's owner.
      # @param account [String] The task's account.
      # @param opportunity [String] The task's opportunity.
      # @param completed_date [DateTime] When the task is completed.
      # @param due_date [DateTime] When the task is due.
      # @param status [Merge::Crm::TaskStatusEnum] The task's status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PatchedTaskRequest]
      def initialize(subject: OMIT, content: OMIT, owner: OMIT, account: OMIT, opportunity: OMIT, completed_date: OMIT,
                     due_date: OMIT, status: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @subject = subject if subject != OMIT
        @content = content if content != OMIT
        @owner = owner if owner != OMIT
        @account = account if account != OMIT
        @opportunity = opportunity if opportunity != OMIT
        @completed_date = completed_date if completed_date != OMIT
        @due_date = due_date if due_date != OMIT
        @status = status if status != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "subject": subject,
          "content": content,
          "owner": owner,
          "account": account,
          "opportunity": opportunity,
          "completed_date": completed_date,
          "due_date": due_date,
          "status": status,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PatchedTaskRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::PatchedTaskRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        subject = parsed_json["subject"]
        content = parsed_json["content"]
        owner = parsed_json["owner"]
        account = parsed_json["account"]
        opportunity = parsed_json["opportunity"]
        completed_date = (DateTime.parse(parsed_json["completed_date"]) unless parsed_json["completed_date"].nil?)
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        status = parsed_json["status"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          subject: subject,
          content: content,
          owner: owner,
          account: account,
          opportunity: opportunity,
          completed_date: completed_date,
          due_date: due_date,
          status: status,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of PatchedTaskRequest to a JSON object
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
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.opportunity&.is_a?(String) != false || raise("Passed value for field obj.opportunity is not the expected type, validation failed.")
        obj.completed_date&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_date is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Crm::TaskStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
