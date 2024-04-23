# frozen_string_literal: true

require_relative "comment_request_user"
require_relative "comment_request_contact"
require_relative "comment_request_ticket"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Comment Object
    #  ### Description
    #  The `Comment` object is used to represent a comment on a ticket.
    #  ### Usage Example
    #  TODO
    class CommentRequest
      # @return [Merge::Ticketing::CommentRequestUser] The author of the Comment, if the author is a User.
      attr_reader :user
      # @return [Merge::Ticketing::CommentRequestContact] The author of the Comment, if the author is a Contact.
      attr_reader :contact
      # @return [String] The comment's text body.
      attr_reader :body
      # @return [String] The comment's text body formatted as html.
      attr_reader :html_body
      # @return [Merge::Ticketing::CommentRequestTicket] The ticket associated with the comment.
      attr_reader :ticket
      # @return [Boolean] Whether or not the comment is internal.
      attr_reader :is_private
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param user [Merge::Ticketing::CommentRequestUser] The author of the Comment, if the author is a User.
      # @param contact [Merge::Ticketing::CommentRequestContact] The author of the Comment, if the author is a Contact.
      # @param body [String] The comment's text body.
      # @param html_body [String] The comment's text body formatted as html.
      # @param ticket [Merge::Ticketing::CommentRequestTicket] The ticket associated with the comment.
      # @param is_private [Boolean] Whether or not the comment is internal.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::CommentRequest]
      def initialize(user: OMIT, contact: OMIT, body: OMIT, html_body: OMIT, ticket: OMIT, is_private: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @user = user if user != OMIT
        @contact = contact if contact != OMIT
        @body = body if body != OMIT
        @html_body = html_body if html_body != OMIT
        @ticket = ticket if ticket != OMIT
        @is_private = is_private if is_private != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "user": user,
          "contact": contact,
          "body": body,
          "html_body": html_body,
          "ticket": ticket,
          "is_private": is_private,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CommentRequest
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::CommentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Ticketing::CommentRequestUser.from_json(json_object: user)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Ticketing::CommentRequestContact.from_json(json_object: contact)
        end
        body = struct["body"]
        html_body = struct["html_body"]
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Merge::Ticketing::CommentRequestTicket.from_json(json_object: ticket)
        end
        is_private = struct["is_private"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          user: user,
          contact: contact,
          body: body,
          html_body: html_body,
          ticket: ticket,
          is_private: is_private,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of CommentRequest to a JSON object
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
        obj.user.nil? || Merge::Ticketing::CommentRequestUser.validate_raw(obj: obj.user)
        obj.contact.nil? || Merge::Ticketing::CommentRequestContact.validate_raw(obj: obj.contact)
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.html_body&.is_a?(String) != false || raise("Passed value for field obj.html_body is not the expected type, validation failed.")
        obj.ticket.nil? || Merge::Ticketing::CommentRequestTicket.validate_raw(obj: obj.ticket)
        obj.is_private&.is_a?(Boolean) != false || raise("Passed value for field obj.is_private is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
