# frozen_string_literal: true

require_relative "field_mapping_api_instance"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class FieldMappingApiInstanceResponse
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :ticket
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :comment
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :project
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :collection
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :user
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :role
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :account
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :team
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :attachment
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :tag
      # @return [Array<Merge::Ticketing::FieldMappingApiInstance>]
      attr_reader :contact
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param ticket [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param comment [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param project [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param collection [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param user [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param role [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param account [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param team [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param attachment [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param tag [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param contact [Array<Merge::Ticketing::FieldMappingApiInstance>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::FieldMappingApiInstanceResponse]
      def initialize(ticket: OMIT, comment: OMIT, project: OMIT, collection: OMIT, user: OMIT, role: OMIT,
                     account: OMIT, team: OMIT, attachment: OMIT, tag: OMIT, contact: OMIT, additional_properties: nil)
        @ticket = ticket if ticket != OMIT
        @comment = comment if comment != OMIT
        @project = project if project != OMIT
        @collection = collection if collection != OMIT
        @user = user if user != OMIT
        @role = role if role != OMIT
        @account = account if account != OMIT
        @team = team if team != OMIT
        @attachment = attachment if attachment != OMIT
        @tag = tag if tag != OMIT
        @contact = contact if contact != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "Ticket": ticket,
          "Comment": comment,
          "Project": project,
          "Collection": collection,
          "User": user,
          "Role": role,
          "Account": account,
          "Team": team,
          "Attachment": attachment,
          "Tag": tag,
          "Contact": contact
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FieldMappingApiInstanceResponse
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::FieldMappingApiInstanceResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        ticket = parsed_json["Ticket"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        comment = parsed_json["Comment"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        project = parsed_json["Project"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        collection = parsed_json["Collection"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        user = parsed_json["User"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        role = parsed_json["Role"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        account = parsed_json["Account"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        team = parsed_json["Team"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        attachment = parsed_json["Attachment"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        tag = parsed_json["Tag"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        contact = parsed_json["Contact"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::FieldMappingApiInstance.from_json(json_object: v)
        end
        new(
          ticket: ticket,
          comment: comment,
          project: project,
          collection: collection,
          user: user,
          role: role,
          account: account,
          team: team,
          attachment: attachment,
          tag: tag,
          contact: contact,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldMappingApiInstanceResponse to a JSON object
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
        obj.ticket&.is_a?(Array) != false || raise("Passed value for field obj.ticket is not the expected type, validation failed.")
        obj.comment&.is_a?(Array) != false || raise("Passed value for field obj.comment is not the expected type, validation failed.")
        obj.project&.is_a?(Array) != false || raise("Passed value for field obj.project is not the expected type, validation failed.")
        obj.collection&.is_a?(Array) != false || raise("Passed value for field obj.collection is not the expected type, validation failed.")
        obj.user&.is_a?(Array) != false || raise("Passed value for field obj.user is not the expected type, validation failed.")
        obj.role&.is_a?(Array) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
        obj.account&.is_a?(Array) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.team&.is_a?(Array) != false || raise("Passed value for field obj.team is not the expected type, validation failed.")
        obj.attachment&.is_a?(Array) != false || raise("Passed value for field obj.attachment is not the expected type, validation failed.")
        obj.tag&.is_a?(Array) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
        obj.contact&.is_a?(Array) != false || raise("Passed value for field obj.contact is not the expected type, validation failed.")
      end
    end
  end
end
