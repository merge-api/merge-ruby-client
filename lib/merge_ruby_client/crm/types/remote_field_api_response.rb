# frozen_string_literal: true

require_relative "remote_field_api"
require "ostruct"
require "json"

module Merge
  module Crm
    class RemoteFieldApiResponse
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :account
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :contact
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :lead
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :note
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :opportunity
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :stage
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :user
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :task
      # @return [Array<Merge::Crm::RemoteFieldApi>]
      attr_reader :engagement
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param account [Array<Merge::Crm::RemoteFieldApi>]
      # @param contact [Array<Merge::Crm::RemoteFieldApi>]
      # @param lead [Array<Merge::Crm::RemoteFieldApi>]
      # @param note [Array<Merge::Crm::RemoteFieldApi>]
      # @param opportunity [Array<Merge::Crm::RemoteFieldApi>]
      # @param stage [Array<Merge::Crm::RemoteFieldApi>]
      # @param user [Array<Merge::Crm::RemoteFieldApi>]
      # @param task [Array<Merge::Crm::RemoteFieldApi>]
      # @param engagement [Array<Merge::Crm::RemoteFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::RemoteFieldApiResponse]
      def initialize(account: OMIT, contact: OMIT, lead: OMIT, note: OMIT, opportunity: OMIT, stage: OMIT, user: OMIT,
                     task: OMIT, engagement: OMIT, additional_properties: nil)
        @account = account if account != OMIT
        @contact = contact if contact != OMIT
        @lead = lead if lead != OMIT
        @note = note if note != OMIT
        @opportunity = opportunity if opportunity != OMIT
        @stage = stage if stage != OMIT
        @user = user if user != OMIT
        @task = task if task != OMIT
        @engagement = engagement if engagement != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "Account": account,
          "Contact": contact,
          "Lead": lead,
          "Note": note,
          "Opportunity": opportunity,
          "Stage": stage,
          "User": user,
          "Task": task,
          "Engagement": engagement
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Crm::RemoteFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        account = parsed_json["Account"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        contact = parsed_json["Contact"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        lead = parsed_json["Lead"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        note = parsed_json["Note"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        opportunity = parsed_json["Opportunity"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        stage = parsed_json["Stage"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        user = parsed_json["User"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        task = parsed_json["Task"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        engagement = parsed_json["Engagement"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldApi.from_json(json_object: v)
        end
        new(
          account: account,
          contact: contact,
          lead: lead,
          note: note,
          opportunity: opportunity,
          stage: stage,
          user: user,
          task: task,
          engagement: engagement,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldApiResponse to a JSON object
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
        obj.account&.is_a?(Array) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.contact&.is_a?(Array) != false || raise("Passed value for field obj.contact is not the expected type, validation failed.")
        obj.lead&.is_a?(Array) != false || raise("Passed value for field obj.lead is not the expected type, validation failed.")
        obj.note&.is_a?(Array) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
        obj.opportunity&.is_a?(Array) != false || raise("Passed value for field obj.opportunity is not the expected type, validation failed.")
        obj.stage&.is_a?(Array) != false || raise("Passed value for field obj.stage is not the expected type, validation failed.")
        obj.user&.is_a?(Array) != false || raise("Passed value for field obj.user is not the expected type, validation failed.")
        obj.task&.is_a?(Array) != false || raise("Passed value for field obj.task is not the expected type, validation failed.")
        obj.engagement&.is_a?(Array) != false || raise("Passed value for field obj.engagement is not the expected type, validation failed.")
      end
    end
  end
end
