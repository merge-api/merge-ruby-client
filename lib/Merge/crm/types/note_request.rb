# frozen_string_literal: true
require_relative "note_request_owner"
require_relative "note_request_contact"
require_relative "note_request_account"
require_relative "note_request_opportunity"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Note Object 
### Description

The `Note` object is used to represent a note on another object.

### Usage Example

TODO
    class NoteRequest
      attr_reader :owner, :content, :contact, :account, :opportunity, :integration_params, :linked_account_params, :remote_fields, :additional_properties
      # @param owner [Crm::NoteRequestOwner] The note's owner.
      # @param content [String] The note's content.
      # @param contact [Crm::NoteRequestContact] The note's contact.
      # @param account [Crm::NoteRequestAccount] The note's account.
      # @param opportunity [Crm::NoteRequestOpportunity] The note's opportunity.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param remote_fields [Array<Crm::RemoteFieldRequest>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::NoteRequest]
      def initialize(owner: nil, content: nil, contact: nil, account: nil, opportunity: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::NoteRequestOwner] The note's owner.
        @owner = owner
        # @type [String] The note's content.
        @content = content
        # @type [Crm::NoteRequestContact] The note's contact.
        @contact = contact
        # @type [Crm::NoteRequestAccount] The note's account.
        @account = account
        # @type [Crm::NoteRequestOpportunity] The note's opportunity.
        @opportunity = opportunity
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of NoteRequest
      #
      # @param json_object [JSON] 
      # @return [Crm::NoteRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        owner = struct.owner.to_h.to_json()
        owner = Crm::NoteRequestOwner.from_json(json_object: owner)
        content = struct.content
        contact = struct.contact.to_h.to_json()
        contact = Crm::NoteRequestContact.from_json(json_object: contact)
        account = struct.account.to_h.to_json()
        account = Crm::NoteRequestAccount.from_json(json_object: account)
        opportunity = struct.opportunity.to_h.to_json()
        opportunity = Crm::NoteRequestOpportunity.from_json(json_object: opportunity)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteFieldRequest.from_json(json_object: v)
end
        new(owner: owner, content: content, contact: contact, account: account, opportunity: opportunity, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of NoteRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "owner": @owner, "content": @content, "contact": @contact, "account": @account, "opportunity": @opportunity, "integration_params": @integration_params, "linked_account_params": @linked_account_params, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner.nil?() || Crm::NoteRequestOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.contact.nil?() || Crm::NoteRequestContact.validate_raw(obj: obj.contact)
        obj.account.nil?() || Crm::NoteRequestAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil?() || Crm::NoteRequestOpportunity.validate_raw(obj: obj.opportunity)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end