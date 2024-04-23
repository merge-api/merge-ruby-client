# frozen_string_literal: true

require_relative "engagement_request_owner"
require_relative "direction_enum"
require_relative "engagement_request_engagement_type"
require "date"
require_relative "engagement_request_account"
require_relative "engagement_request_contacts_item"
require_relative "remote_field_request"
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
    class EngagementRequest
      # @return [Merge::Crm::EngagementRequestOwner] The engagement's owner.
      attr_reader :owner
      # @return [String] The engagement's content.
      attr_reader :content
      # @return [String] The engagement's subject.
      attr_reader :subject
      # @return [Merge::Crm::DirectionEnum] The engagement's direction.
      #  - `INBOUND` - INBOUND
      #  - `OUTBOUND` - OUTBOUND
      attr_reader :direction
      # @return [Merge::Crm::EngagementRequestEngagementType] The engagement type of the engagement.
      attr_reader :engagement_type
      # @return [DateTime] The time at which the engagement started.
      attr_reader :start_time
      # @return [DateTime] The time at which the engagement ended.
      attr_reader :end_time
      # @return [Merge::Crm::EngagementRequestAccount] The account of the engagement.
      attr_reader :account
      # @return [Array<Merge::Crm::EngagementRequestContactsItem>]
      attr_reader :contacts
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

      # @param owner [Merge::Crm::EngagementRequestOwner] The engagement's owner.
      # @param content [String] The engagement's content.
      # @param subject [String] The engagement's subject.
      # @param direction [Merge::Crm::DirectionEnum] The engagement's direction.
      #  - `INBOUND` - INBOUND
      #  - `OUTBOUND` - OUTBOUND
      # @param engagement_type [Merge::Crm::EngagementRequestEngagementType] The engagement type of the engagement.
      # @param start_time [DateTime] The time at which the engagement started.
      # @param end_time [DateTime] The time at which the engagement ended.
      # @param account [Merge::Crm::EngagementRequestAccount] The account of the engagement.
      # @param contacts [Array<Merge::Crm::EngagementRequestContactsItem>]
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::EngagementRequest]
      def initialize(owner: OMIT, content: OMIT, subject: OMIT, direction: OMIT, engagement_type: OMIT,
                     start_time: OMIT, end_time: OMIT, account: OMIT, contacts: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @owner = owner if owner != OMIT
        @content = content if content != OMIT
        @subject = subject if subject != OMIT
        @direction = direction if direction != OMIT
        @engagement_type = engagement_type if engagement_type != OMIT
        @start_time = start_time if start_time != OMIT
        @end_time = end_time if end_time != OMIT
        @account = account if account != OMIT
        @contacts = contacts if contacts != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "owner": owner,
          "content": content,
          "subject": subject,
          "direction": direction,
          "engagement_type": engagement_type,
          "start_time": start_time,
          "end_time": end_time,
          "account": account,
          "contacts": contacts,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EngagementRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::EngagementRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::EngagementRequestOwner.from_json(json_object: owner)
        end
        content = struct["content"]
        subject = struct["subject"]
        direction = struct["direction"]
        if parsed_json["engagement_type"].nil?
          engagement_type = nil
        else
          engagement_type = parsed_json["engagement_type"].to_json
          engagement_type = Merge::Crm::EngagementRequestEngagementType.from_json(json_object: engagement_type)
        end
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::EngagementRequestAccount.from_json(json_object: account)
        end
        contacts = parsed_json["contacts"]&.map do |v|
          v = v.to_json
          Merge::Crm::EngagementRequestContactsItem.from_json(json_object: v)
        end
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(
          owner: owner,
          content: content,
          subject: subject,
          direction: direction,
          engagement_type: engagement_type,
          start_time: start_time,
          end_time: end_time,
          account: account,
          contacts: contacts,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of EngagementRequest to a JSON object
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
        obj.owner.nil? || Merge::Crm::EngagementRequestOwner.validate_raw(obj: obj.owner)
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction&.is_a?(Merge::Crm::DirectionEnum) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
        obj.engagement_type.nil? || Merge::Crm::EngagementRequestEngagementType.validate_raw(obj: obj.engagement_type)
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.account.nil? || Merge::Crm::EngagementRequestAccount.validate_raw(obj: obj.account)
        obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
