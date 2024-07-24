# frozen_string_literal: true

require_relative "note_request_owner"
require_relative "note_request_contact"
require_relative "note_request_account"
require_relative "note_request_opportunity"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Note Object
    #  ### Description
    #  The `Note` object is used to represent a note on another object.
    #  ### Usage Example
    #  TODO
    class NoteRequest
      # @return [Merge::Crm::NoteRequestOwner] The note's owner.
      attr_reader :owner
      # @return [String] The note's content.
      attr_reader :content
      # @return [Merge::Crm::NoteRequestContact] The note's contact.
      attr_reader :contact
      # @return [Merge::Crm::NoteRequestAccount] The note's account.
      attr_reader :account
      # @return [Merge::Crm::NoteRequestOpportunity] The note's opportunity.
      attr_reader :opportunity
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

      # @param owner [Merge::Crm::NoteRequestOwner] The note's owner.
      # @param content [String] The note's content.
      # @param contact [Merge::Crm::NoteRequestContact] The note's contact.
      # @param account [Merge::Crm::NoteRequestAccount] The note's account.
      # @param opportunity [Merge::Crm::NoteRequestOpportunity] The note's opportunity.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::NoteRequest]
      def initialize(owner: OMIT, content: OMIT, contact: OMIT, account: OMIT, opportunity: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @owner = owner if owner != OMIT
        @content = content if content != OMIT
        @contact = contact if contact != OMIT
        @account = account if account != OMIT
        @opportunity = opportunity if opportunity != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "owner": owner,
          "content": content,
          "contact": contact,
          "account": account,
          "opportunity": opportunity,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of NoteRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::NoteRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::NoteRequestOwner.from_json(json_object: owner)
        end
        content = parsed_json["content"]
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Crm::NoteRequestContact.from_json(json_object: contact)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::NoteRequestAccount.from_json(json_object: account)
        end
        if parsed_json["opportunity"].nil?
          opportunity = nil
        else
          opportunity = parsed_json["opportunity"].to_json
          opportunity = Merge::Crm::NoteRequestOpportunity.from_json(json_object: opportunity)
        end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          owner: owner,
          content: content,
          contact: contact,
          account: account,
          opportunity: opportunity,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of NoteRequest to a JSON object
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
        obj.owner.nil? || Merge::Crm::NoteRequestOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.contact.nil? || Merge::Crm::NoteRequestContact.validate_raw(obj: obj.contact)
        obj.account.nil? || Merge::Crm::NoteRequestAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil? || Merge::Crm::NoteRequestOpportunity.validate_raw(obj: obj.opportunity)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
