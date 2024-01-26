# frozen_string_literal: true
require_relative "task_request_owner"
require_relative "task_request_account"
require_relative "task_request_opportunity"
require "date"
require "date"
require_relative "task_request_status"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Task Object 
### Description

The `Task` object is used to represent a task, such as a to-do item.

### Usage Example

TODO
    class TaskRequest
      attr_reader :subject, :content, :owner, :account, :opportunity, :completed_date, :due_date, :status, :integration_params, :linked_account_params, :remote_fields, :additional_properties
      # @param subject [String] The task's subject.
      # @param content [String] The task's content.
      # @param owner [Crm::TaskRequestOwner] The task's owner.
      # @param account [Crm::TaskRequestAccount] The task's account.
      # @param opportunity [Crm::TaskRequestOpportunity] The task's opportunity.
      # @param completed_date [DateTime] When the task is completed.
      # @param due_date [DateTime] When the task is due.
      # @param status [Crm::TaskRequestStatus] The task's status.  - `OPEN` - OPEN
- `CLOSED` - CLOSED
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param remote_fields [Array<Crm::RemoteFieldRequest>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::TaskRequest]
      def initialize(subject: nil, content: nil, owner: nil, account: nil, opportunity: nil, completed_date: nil, due_date: nil, status: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The task's subject.
        @subject = subject
        # @type [String] The task's content.
        @content = content
        # @type [Crm::TaskRequestOwner] The task's owner.
        @owner = owner
        # @type [Crm::TaskRequestAccount] The task's account.
        @account = account
        # @type [Crm::TaskRequestOpportunity] The task's opportunity.
        @opportunity = opportunity
        # @type [DateTime] When the task is completed.
        @completed_date = completed_date
        # @type [DateTime] When the task is due.
        @due_date = due_date
        # @type [Crm::TaskRequestStatus] The task's status. 
- `OPEN` - OPEN
- `CLOSED` - CLOSED
        @status = status
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of TaskRequest
      #
      # @param json_object [JSON] 
      # @return [Crm::TaskRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        subject = struct.subject
        content = struct.content
        owner = struct.owner.to_h.to_json()
        owner = Crm::TaskRequestOwner.from_json(json_object: owner)
        account = struct.account.to_h.to_json()
        account = Crm::TaskRequestAccount.from_json(json_object: account)
        opportunity = struct.opportunity.to_h.to_json()
        opportunity = Crm::TaskRequestOpportunity.from_json(json_object: opportunity)
        completed_date = DateTime.parse(struct.completed_date)
        due_date = DateTime.parse(struct.due_date)
        status = struct.status.to_h.to_json()
        status = Crm::TaskRequestStatus.from_json(json_object: status)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteFieldRequest.from_json(json_object: v)
end
        new(subject: subject, content: content, owner: owner, account: account, opportunity: opportunity, completed_date: completed_date, due_date: due_date, status: status, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of TaskRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "subject": @subject, "content": @content, "owner": @owner, "account": @account, "opportunity": @opportunity, "completed_date": @completed_date, "due_date": @due_date, "status": @status, "integration_params": @integration_params, "linked_account_params": @linked_account_params, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.owner.nil?() || Crm::TaskRequestOwner.validate_raw(obj: obj.owner)
        obj.account.nil?() || Crm::TaskRequestAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil?() || Crm::TaskRequestOpportunity.validate_raw(obj: obj.opportunity)
        obj.completed_date&.is_a?(DateTime) != false || raise("Passed value for field obj.completed_date is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status.nil?() || Crm::TaskRequestStatus.validate_raw(obj: obj.status)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end