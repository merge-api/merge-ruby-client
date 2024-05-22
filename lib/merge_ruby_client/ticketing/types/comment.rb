# frozen_string_literal: true

require "date"
require_relative "comment_user"
require_relative "comment_contact"
require_relative "comment_ticket"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Comment Object
    #  ### Description
    #  The `Comment` object is used to represent a comment on a ticket.
    #  ### Usage Example
    #  TODO
    class Comment
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ticketing::CommentUser] The author of the Comment, if the author is a User.
      attr_reader :user
      # @return [Merge::Ticketing::CommentContact] The author of the Comment, if the author is a Contact.
      attr_reader :contact
      # @return [String] The comment's text body.
      attr_reader :body
      # @return [String] The comment's text body formatted as html.
      attr_reader :html_body
      # @return [Merge::Ticketing::CommentTicket] The ticket associated with the comment.
      attr_reader :ticket
      # @return [Boolean] Whether or not the comment is internal.
      attr_reader :is_private
      # @return [DateTime] When the third party's comment was created.
      attr_reader :remote_created_at
      # @return [Boolean]
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ticketing::RemoteData>]
      attr_reader :remote_data
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
      # @param user [Merge::Ticketing::CommentUser] The author of the Comment, if the author is a User.
      # @param contact [Merge::Ticketing::CommentContact] The author of the Comment, if the author is a Contact.
      # @param body [String] The comment's text body.
      # @param html_body [String] The comment's text body formatted as html.
      # @param ticket [Merge::Ticketing::CommentTicket] The ticket associated with the comment.
      # @param is_private [Boolean] Whether or not the comment is internal.
      # @param remote_created_at [DateTime] When the third party's comment was created.
      # @param remote_was_deleted [Boolean]
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Comment]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, user: OMIT, contact: OMIT,
                     body: OMIT, html_body: OMIT, ticket: OMIT, is_private: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @user = user if user != OMIT
        @contact = contact if contact != OMIT
        @body = body if body != OMIT
        @html_body = html_body if html_body != OMIT
        @ticket = ticket if ticket != OMIT
        @is_private = is_private if is_private != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "user": user,
          "contact": contact,
          "body": body,
          "html_body": html_body,
          "ticket": ticket,
          "is_private": is_private,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Comment
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Comment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Ticketing::CommentUser.from_json(json_object: user)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Ticketing::CommentContact.from_json(json_object: contact)
        end
        body = struct["body"]
        html_body = struct["html_body"]
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Merge::Ticketing::CommentTicket.from_json(json_object: ticket)
        end
        is_private = struct["is_private"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          user: user,
          contact: contact,
          body: body,
          html_body: html_body,
          ticket: ticket,
          is_private: is_private,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Comment to a JSON object
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
        obj.user.nil? || Merge::Ticketing::CommentUser.validate_raw(obj: obj.user)
        obj.contact.nil? || Merge::Ticketing::CommentContact.validate_raw(obj: obj.contact)
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.html_body&.is_a?(String) != false || raise("Passed value for field obj.html_body is not the expected type, validation failed.")
        obj.ticket.nil? || Merge::Ticketing::CommentTicket.validate_raw(obj: obj.ticket)
        obj.is_private&.is_a?(Boolean) != false || raise("Passed value for field obj.is_private is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
