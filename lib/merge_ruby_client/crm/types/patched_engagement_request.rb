# frozen_string_literal: true

require_relative "direction_enum"
require "date"
require_relative "remote_field_request"
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
    class PatchedEngagementRequest
      attr_reader :owner, :content, :subject, :direction, :engagement_type, :start_time, :end_time, :account,
                  :contacts, :integration_params, :linked_account_params, :remote_fields, :additional_properties

      # @param owner [String] The engagement's owner.
      # @param content [String] The engagement's content.
      # @param subject [String] The engagement's subject.
      # @param direction [DIRECTION_ENUM] The engagement's direction.
      #   - `INBOUND` - INBOUND
      #   - `OUTBOUND` - OUTBOUND
      # @param engagement_type [String] The engagement type of the engagement.
      # @param start_time [DateTime] The time at which the engagement started.
      # @param end_time [DateTime] The time at which the engagement ended.
      # @param account [String] The account of the engagement.
      # @param contacts [Array<String>]
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param remote_fields [Array<Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::PatchedEngagementRequest]
      def initialize(owner: nil, content: nil, subject: nil, direction: nil, engagement_type: nil, start_time: nil,
                     end_time: nil, account: nil, contacts: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The engagement's owner.
        @owner = owner
        # @type [String] The engagement's content.
        @content = content
        # @type [String] The engagement's subject.
        @subject = subject
        # @type [DIRECTION_ENUM] The engagement's direction.
        #   - `INBOUND` - INBOUND
        #   - `OUTBOUND` - OUTBOUND
        @direction = direction
        # @type [String] The engagement type of the engagement.
        @engagement_type = engagement_type
        # @type [DateTime] The time at which the engagement started.
        @start_time = start_time
        # @type [DateTime] The time at which the engagement ended.
        @end_time = end_time
        # @type [String] The account of the engagement.
        @account = account
        # @type [Array<String>]
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

      # Deserialize a JSON object to an instance of PatchedEngagementRequest
      #
      # @param json_object [JSON]
      # @return [Crm::PatchedEngagementRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        owner = struct.owner
        content = struct.content
        subject = struct.subject
        direction = Crm::DIRECTION_ENUM.key(parsed_json["direction"]) || parsed_json["direction"]
        engagement_type = struct.engagement_type
        start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
        end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
        account = struct.account
        contacts = struct.contacts
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(owner: owner, content: content, subject: subject, direction: direction, engagement_type: engagement_type,
            start_time: start_time, end_time: end_time, account: account, contacts: contacts, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of PatchedEngagementRequest to a JSON object
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
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params,
          "remote_fields": @remote_fields
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.direction&.is_a?(Crm::DIRECTION_ENUM) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
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
