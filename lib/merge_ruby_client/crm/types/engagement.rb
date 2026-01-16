# frozen_string_literal: true

require "date"
require_relative "direction_enum"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Engagement Object
    #  ### Description
    #  The `Engagement` object is used to represent an interaction noted in a CRM
    #  system.
    #  ### Usage Example
    #  TODO
    class Engagement
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The engagement's owner.
      attr_reader :owner
      # @return [String] The engagement's content.
      attr_reader :content
      # @return [String] The engagement's subject.
      attr_reader :subject
      # @return [Merge::Crm::DirectionEnum] The engagement's direction.
      #  * `INBOUND` - INBOUND
      #  * `OUTBOUND` - OUTBOUND
      attr_reader :direction
      # @return [String] The engagement type of the engagement.
      attr_reader :engagement_type
      # @return [DateTime] The time at which the engagement started.
      attr_reader :start_time
      # @return [DateTime] The time at which the engagement ended.
      attr_reader :end_time
      # @return [String] The account of the engagement.
      attr_reader :account
      # @return [Array<String>]
      attr_reader :contacts
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
      # @param owner [String] The engagement's owner.
      # @param content [String] The engagement's content.
      # @param subject [String] The engagement's subject.
      # @param direction [Merge::Crm::DirectionEnum] The engagement's direction.
      #  * `INBOUND` - INBOUND
      #  * `OUTBOUND` - OUTBOUND
      # @param engagement_type [String] The engagement type of the engagement.
      # @param start_time [DateTime] The time at which the engagement started.
      # @param end_time [DateTime] The time at which the engagement ended.
      # @param account [String] The account of the engagement.
      # @param contacts [Array<String>]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Engagement]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, owner: OMIT, content: OMIT,
                     subject: OMIT, direction: OMIT, engagement_type: OMIT, start_time: OMIT, end_time: OMIT, account: OMIT, contacts: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @owner = owner if owner != OMIT
        @content = content if content != OMIT
        @subject = subject if subject != OMIT
        @direction = direction if direction != OMIT
        @engagement_type = engagement_type if engagement_type != OMIT
        @start_time = start_time if start_time != OMIT
        @end_time = end_time if end_time != OMIT
        @account = account if account != OMIT
        @contacts = contacts if contacts != OMIT
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
          "subject": subject,
          "direction": direction,
          "engagement_type": engagement_type,
          "start_time": start_time,
          "end_time": end_time,
          "account": account,
          "contacts": contacts,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Engagement
      #
      # @param json_object [String]
      # @return [Merge::Crm::Engagement]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        owner = parsed_json["owner"]
        content = parsed_json["content"]
        subject = parsed_json["subject"]
        direction = parsed_json["direction"]
        engagement_type = parsed_json["engagement_type"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        account = parsed_json["account"]
        contacts = parsed_json["contacts"]
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
          owner: owner,
          content: content,
          subject: subject,
          direction: direction,
          engagement_type: engagement_type,
          start_time: start_time,
          end_time: end_time,
          account: account,
          contacts: contacts,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Engagement to a JSON object
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
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction&.is_a?(Merge::Crm::DirectionEnum) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
        obj.engagement_type&.is_a?(String) != false || raise("Passed value for field obj.engagement_type is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
