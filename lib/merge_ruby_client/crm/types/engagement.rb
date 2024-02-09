# frozen_string_literal: true

require_relative "engagement_owner"
require_relative "direction_enum"
require_relative "engagement_engagement_type"
require "date"
require_relative "engagement_account"
require_relative "engagement_contacts_item"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Engagement Object
    #
    # ### Description
    #
    # The `Engagement` object is used to represent an interaction noted in a CRM system.
    #
    # ### Usage Example
    #
    # TODO
    class Engagement
      attr_reader :owner, :content, :subject, :direction, :engagement_type, :start_time, :end_time, :account,
                  :contacts, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties

      # @param owner [Crm::EngagementOwner] The engagement's owner.
      # @param content [String] The engagement's content.
      # @param subject [String] The engagement's subject.
      # @param direction [DIRECTION_ENUM] The engagement's direction.
      #   - `INBOUND` - INBOUND
      #   - `OUTBOUND` - OUTBOUND
      # @param engagement_type [Crm::EngagementEngagementType] The engagement type of the engagement.
      # @param start_time [DateTime] The time at which the engagement started.
      # @param end_time [DateTime] The time at which the engagement ended.
      # @param account [Crm::EngagementAccount] The account of the engagement.
      # @param contacts [Array<Crm::EngagementContactsItem>]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Crm::RemoteData>]
      # @param remote_fields [Array<Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Engagement]
      def initialize(owner: nil, content: nil, subject: nil, direction: nil, engagement_type: nil, start_time: nil,
                     end_time: nil, account: nil, contacts: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::EngagementOwner] The engagement's owner.
        @owner = owner
        # @type [String] The engagement's content.
        @content = content
        # @type [String] The engagement's subject.
        @subject = subject
        # @type [DIRECTION_ENUM] The engagement's direction.
        #   - `INBOUND` - INBOUND
        #   - `OUTBOUND` - OUTBOUND
        @direction = direction
        # @type [Crm::EngagementEngagementType] The engagement type of the engagement.
        @engagement_type = engagement_type
        # @type [DateTime] The time at which the engagement started.
        @start_time = start_time
        # @type [DateTime] The time at which the engagement ended.
        @end_time = end_time
        # @type [Crm::EngagementAccount] The account of the engagement.
        @account = account
        # @type [Array<Crm::EngagementContactsItem>]
        @contacts = contacts
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

      # Deserialize a JSON object to an instance of Engagement
      #
      # @param json_object [JSON]
      # @return [Crm::Engagement]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Crm::EngagementOwner.from_json(json_object: owner)
        end
        content = struct.content
        subject = struct.subject
        direction = Crm::DIRECTION_ENUM.key(parsed_json["direction"]) || parsed_json["direction"]
        if parsed_json["engagement_type"].nil?
          engagement_type = nil
        else
          engagement_type = parsed_json["engagement_type"].to_json
          engagement_type = Crm::EngagementEngagementType.from_json(json_object: engagement_type)
        end
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Crm::EngagementAccount.from_json(json_object: account)
        end
        contacts = parsed_json["contacts"]&.map do |v|
          v = v.to_json
          Crm::EngagementContactsItem.from_json(json_object: v)
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
        new(owner: owner, content: content, subject: subject, direction: direction, engagement_type: engagement_type,
            start_time: start_time, end_time: end_time, account: account, contacts: contacts, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of Engagement to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "owner": @owner,
          "content": @content,
          "subject": @subject,
          "direction": Crm::DIRECTION_ENUM[@direction] || @direction,
          "engagement_type": @engagement_type,
          "start_time": @start_time,
          "end_time": @end_time,
          "account": @account,
          "contacts": @contacts,
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
        obj.owner.nil? || Crm::EngagementOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction&.is_a?(Crm::DIRECTION_ENUM) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
        obj.engagement_type.nil? || Crm::EngagementEngagementType.validate_raw(obj: obj.engagement_type)
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.account.nil? || Crm::EngagementAccount.validate_raw(obj: obj.account)
        obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
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
