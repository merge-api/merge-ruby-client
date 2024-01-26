# frozen_string_literal: true
require_relative "engagement_request_owner"
require_relative "engagement_request_direction"
require_relative "engagement_request_engagement_type"
require "date"
require "date"
require_relative "engagement_request_account"
require_relative "engagement_request_contacts_item"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Engagement Object 
### Description

The `Engagement` object is used to represent an interaction noted in a CRM system.

### Usage Example

TODO
    class EngagementRequest
      attr_reader :owner, :content, :subject, :direction, :engagement_type, :start_time, :end_time, :account, :contacts, :integration_params, :linked_account_params, :remote_fields, :additional_properties
      # @param owner [Crm::EngagementRequestOwner] The engagement's owner.
      # @param content [String] The engagement's content.
      # @param subject [String] The engagement's subject.
      # @param direction [Crm::EngagementRequestDirection] The engagement's direction.  - `INBOUND` - INBOUND
- `OUTBOUND` - OUTBOUND
      # @param engagement_type [Crm::EngagementRequestEngagementType] The engagement type of the engagement.
      # @param start_time [DateTime] The time at which the engagement started.
      # @param end_time [DateTime] The time at which the engagement ended.
      # @param account [Crm::EngagementRequestAccount] The account of the engagement.
      # @param contacts [Array<Crm::EngagementRequestContactsItem>] 
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param remote_fields [Array<Crm::RemoteFieldRequest>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::EngagementRequest]
      def initialize(owner: nil, content: nil, subject: nil, direction: nil, engagement_type: nil, start_time: nil, end_time: nil, account: nil, contacts: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::EngagementRequestOwner] The engagement's owner.
        @owner = owner
        # @type [String] The engagement's content.
        @content = content
        # @type [String] The engagement's subject.
        @subject = subject
        # @type [Crm::EngagementRequestDirection] The engagement's direction. 
- `INBOUND` - INBOUND
- `OUTBOUND` - OUTBOUND
        @direction = direction
        # @type [Crm::EngagementRequestEngagementType] The engagement type of the engagement.
        @engagement_type = engagement_type
        # @type [DateTime] The time at which the engagement started.
        @start_time = start_time
        # @type [DateTime] The time at which the engagement ended.
        @end_time = end_time
        # @type [Crm::EngagementRequestAccount] The account of the engagement.
        @account = account
        # @type [Array<Crm::EngagementRequestContactsItem>] 
        @contacts = contacts
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of EngagementRequest
      #
      # @param json_object [JSON] 
      # @return [Crm::EngagementRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        owner = struct.owner.to_h.to_json()
        owner = Crm::EngagementRequestOwner.from_json(json_object: owner)
        content = struct.content
        subject = struct.subject
        direction = struct.direction.to_h.to_json()
        direction = Crm::EngagementRequestDirection.from_json(json_object: direction)
        engagement_type = struct.engagement_type.to_h.to_json()
        engagement_type = Crm::EngagementRequestEngagementType.from_json(json_object: engagement_type)
        start_time = DateTime.parse(struct.start_time)
        end_time = DateTime.parse(struct.end_time)
        account = struct.account.to_h.to_json()
        account = Crm::EngagementRequestAccount.from_json(json_object: account)
        contacts = struct.contacts.map() do | v |
  v = v.to_h.to_json()
  Crm::EngagementRequestContactsItem.from_json(json_object: v)
end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteFieldRequest.from_json(json_object: v)
end
        new(owner: owner, content: content, subject: subject, direction: direction, engagement_type: engagement_type, start_time: start_time, end_time: end_time, account: account, contacts: contacts, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of EngagementRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "owner": @owner, "content": @content, "subject": @subject, "direction": @direction, "engagement_type": @engagement_type, "start_time": @start_time, "end_time": @end_time, "account": @account, "contacts": @contacts, "integration_params": @integration_params, "linked_account_params": @linked_account_params, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner.nil?() || Crm::EngagementRequestOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction.nil?() || Crm::EngagementRequestDirection.validate_raw(obj: obj.direction)
        obj.engagement_type.nil?() || Crm::EngagementRequestEngagementType.validate_raw(obj: obj.engagement_type)
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.account.nil?() || Crm::EngagementRequestAccount.validate_raw(obj: obj.account)
        obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end