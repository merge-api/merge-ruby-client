# frozen_string_literal: true
require_relative "comment_user"
require_relative "comment_contact"
require_relative "comment_ticket"
require "date"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ticketing
    # # The Comment Object 
### Description

The `Comment` object is used to represent a comment on a ticket.

### Usage Example

TODO
    class Comment
      attr_reader :id, :remote_id, :user, :contact, :body, :html_body, :ticket, :is_private, :remote_created_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param user [Ticketing::CommentUser] The author of the Comment, if the author is a User.
      # @param contact [Ticketing::CommentContact] The author of the Comment, if the author is a Contact.
      # @param body [String] The comment's text body.
      # @param html_body [String] The comment's text body formatted as html.
      # @param ticket [Ticketing::CommentTicket] The ticket associated with the comment.
      # @param is_private [Boolean] Whether or not the comment is internal.
      # @param remote_created_at [DateTime] When the third party's comment was created.
      # @param remote_was_deleted [Boolean] 
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ticketing::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::Comment]
      def initialize(id: nil, remote_id: nil, user: nil, contact: nil, body: nil, html_body: nil, ticket: nil, is_private: nil, remote_created_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ticketing::CommentUser] The author of the Comment, if the author is a User.
        @user = user
        # @type [Ticketing::CommentContact] The author of the Comment, if the author is a Contact.
        @contact = contact
        # @type [String] The comment's text body.
        @body = body
        # @type [String] The comment's text body formatted as html.
        @html_body = html_body
        # @type [Ticketing::CommentTicket] The ticket associated with the comment.
        @ticket = ticket
        # @type [Boolean] Whether or not the comment is internal.
        @is_private = is_private
        # @type [DateTime] When the third party's comment was created.
        @remote_created_at = remote_created_at
        # @type [Boolean] 
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Ticketing::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Comment
      #
      # @param json_object [JSON] 
      # @return [Ticketing::Comment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        user = struct.user.to_h.to_json()
        user = Ticketing::CommentUser.from_json(json_object: user)
        contact = struct.contact.to_h.to_json()
        contact = Ticketing::CommentContact.from_json(json_object: contact)
        body = struct.body
        html_body = struct.html_body
        ticket = struct.ticket.to_h.to_json()
        ticket = Ticketing::CommentTicket.from_json(json_object: ticket)
        is_private = struct.is_private
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ticketing::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, user: user, contact: contact, body: body, html_body: html_body, ticket: ticket, is_private: is_private, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of Comment to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "user": @user, "contact": @contact, "body": @body, "html_body": @html_body, "ticket": @ticket, "is_private": @is_private, "remote_created_at": @remote_created_at, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.user.nil?() || Ticketing::CommentUser.validate_raw(obj: obj.user)
        obj.contact.nil?() || Ticketing::CommentContact.validate_raw(obj: obj.contact)
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.html_body&.is_a?(String) != false || raise("Passed value for field obj.html_body is not the expected type, validation failed.")
        obj.ticket.nil?() || Ticketing::CommentTicket.validate_raw(obj: obj.ticket)
        obj.is_private&.is_a?(Boolean) != false || raise("Passed value for field obj.is_private is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end