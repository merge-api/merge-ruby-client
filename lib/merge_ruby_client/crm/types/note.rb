# frozen_string_literal: true

require_relative "note_owner"
require_relative "note_contact"
require_relative "note_account"
require_relative "note_opportunity"
require "date"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Note Object
    #
    # ### Description
    #
    # The `Note` object is used to represent a note on another object.
    #
    # ### Usage Example
    #
    # TODO
    class Note
      attr_reader :owner, :content, :contact, :account, :opportunity, :remote_updated_at, :remote_created_at,
                  :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties

      # @param owner [Crm::NoteOwner] The note's owner.
      # @param content [String] The note's content.
      # @param contact [Crm::NoteContact] The note's contact.
      # @param account [Crm::NoteAccount] The note's account.
      # @param opportunity [Crm::NoteOpportunity] The note's opportunity.
      # @param remote_updated_at [DateTime] When the third party's lead was updated.
      # @param remote_created_at [DateTime] When the third party's lead was created.
      # @param remote_was_deleted [Boolean]
      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Crm::RemoteData>]
      # @param remote_fields [Array<Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Note]
      def initialize(owner: nil, content: nil, contact: nil, account: nil, opportunity: nil, remote_updated_at: nil,
                     remote_created_at: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::NoteOwner] The note's owner.
        @owner = owner
        # @type [String] The note's content.
        @content = content
        # @type [Crm::NoteContact] The note's contact.
        @contact = contact
        # @type [Crm::NoteAccount] The note's account.
        @account = account
        # @type [Crm::NoteOpportunity] The note's opportunity.
        @opportunity = opportunity
        # @type [DateTime] When the third party's lead was updated.
        @remote_updated_at = remote_updated_at
        # @type [DateTime] When the third party's lead was created.
        @remote_created_at = remote_created_at
        # @type [Boolean]
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

      # Deserialize a JSON object to an instance of Note
      #
      # @param json_object [JSON]
      # @return [Crm::Note]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Crm::NoteOwner.from_json(json_object: owner)
        end
        content = struct.content
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Crm::NoteContact.from_json(json_object: contact)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Crm::NoteAccount.from_json(json_object: account)
        end
        if parsed_json["opportunity"].nil?
          opportunity = nil
        else
          opportunity = parsed_json["opportunity"].to_json
          opportunity = Crm::NoteOpportunity.from_json(json_object: opportunity)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
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
        new(owner: owner, content: content, contact: contact, account: account, opportunity: opportunity,
            remote_updated_at: remote_updated_at, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of Note to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "owner": @owner,
          "content": @content,
          "contact": @contact,
          "account": @account,
          "opportunity": @opportunity,
          "remote_updated_at": @remote_updated_at,
          "remote_created_at": @remote_created_at,
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
        obj.owner.nil? || Crm::NoteOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.contact.nil? || Crm::NoteContact.validate_raw(obj: obj.contact)
        obj.account.nil? || Crm::NoteAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil? || Crm::NoteOpportunity.validate_raw(obj: obj.opportunity)
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
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
