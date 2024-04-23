# frozen_string_literal: true

require "date"
require_relative "note_owner"
require_relative "note_contact"
require_relative "note_account"
require_relative "note_opportunity"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Note Object
    #  ### Description
    #  The `Note` object is used to represent a note on another object.
    #  ### Usage Example
    #  TODO
    class Note
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [Merge::Crm::NoteOwner] The note's owner.
      attr_reader :owner
      # @return [String] The note's content.
      attr_reader :content
      # @return [Merge::Crm::NoteContact] The note's contact.
      attr_reader :contact
      # @return [Merge::Crm::NoteAccount] The note's account.
      attr_reader :account
      # @return [Merge::Crm::NoteOpportunity] The note's opportunity.
      attr_reader :opportunity
      # @return [DateTime] When the third party's lead was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the third party's lead was created.
      attr_reader :remote_created_at
      # @return [Boolean]
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
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param owner [Merge::Crm::NoteOwner] The note's owner.
      # @param content [String] The note's content.
      # @param contact [Merge::Crm::NoteContact] The note's contact.
      # @param account [Merge::Crm::NoteAccount] The note's account.
      # @param opportunity [Merge::Crm::NoteOpportunity] The note's opportunity.
      # @param remote_updated_at [DateTime] When the third party's lead was updated.
      # @param remote_created_at [DateTime] When the third party's lead was created.
      # @param remote_was_deleted [Boolean]
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Note]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, owner: OMIT, content: OMIT,
                     contact: OMIT, account: OMIT, opportunity: OMIT, remote_updated_at: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @owner = owner if owner != OMIT
        @content = content if content != OMIT
        @contact = contact if contact != OMIT
        @account = account if account != OMIT
        @opportunity = opportunity if opportunity != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
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
          "owner": owner,
          "content": content,
          "contact": contact,
          "account": account,
          "opportunity": opportunity,
          "remote_updated_at": remote_updated_at,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Note
      #
      # @param json_object [String]
      # @return [Merge::Crm::Note]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::NoteOwner.from_json(json_object: owner)
        end
        content = struct["content"]
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Crm::NoteContact.from_json(json_object: contact)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::NoteAccount.from_json(json_object: account)
        end
        if parsed_json["opportunity"].nil?
          opportunity = nil
        else
          opportunity = parsed_json["opportunity"].to_json
          opportunity = Merge::Crm::NoteOpportunity.from_json(json_object: opportunity)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteData.from_json(json_object: v)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteField.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          owner: owner,
          content: content,
          contact: contact,
          account: account,
          opportunity: opportunity,
          remote_updated_at: remote_updated_at,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Note to a JSON object
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
        obj.owner.nil? || Merge::Crm::NoteOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.contact.nil? || Merge::Crm::NoteContact.validate_raw(obj: obj.contact)
        obj.account.nil? || Merge::Crm::NoteAccount.validate_raw(obj: obj.account)
        obj.opportunity.nil? || Merge::Crm::NoteOpportunity.validate_raw(obj: obj.opportunity)
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
