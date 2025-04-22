# frozen_string_literal: true

require_relative "direction_enum"
require "date"
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
    class PatchedEngagementRequest
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
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PatchedEngagementRequest]
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

      # Deserialize a JSON object to an instance of PatchedEngagementRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::PatchedEngagementRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        owner = parsed_json["owner"]
        content = parsed_json["content"]
        subject = parsed_json["subject"]
        direction = parsed_json["direction"]
        engagement_type = parsed_json["engagement_type"]
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        account = parsed_json["account"]
        contacts = parsed_json["contacts"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: item)
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

      # Serialize an instance of PatchedEngagementRequest to a JSON object
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
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction&.is_a?(Merge::Crm::DirectionEnum) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
        obj.engagement_type&.is_a?(String) != false || raise("Passed value for field obj.engagement_type is not the expected type, validation failed.")
        obj.start_time&.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
        obj.end_time&.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.contacts&.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
