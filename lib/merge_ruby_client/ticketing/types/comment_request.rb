# frozen_string_literal: true

require_relative "comment_request_user"
require_relative "comment_request_contact"
require_relative "comment_request_ticket"
require "json"

module Merge
  module Ticketing
    # # The Comment Object
    #
    # ### Description
    #
    # The `Comment` object is used to represent a comment on a ticket.
    #
    # ### Usage Example
    #
    # TODO
    class CommentRequest
      attr_reader :user, :contact, :body, :html_body, :ticket, :is_private, :integration_params,
                  :linked_account_params, :additional_properties

      # @param user [Ticketing::CommentRequestUser] The author of the Comment, if the author is a User.
      # @param contact [Ticketing::CommentRequestContact] The author of the Comment, if the author is a Contact.
      # @param body [String] The comment's text body.
      # @param html_body [String] The comment's text body formatted as html.
      # @param ticket [Ticketing::CommentRequestTicket] The ticket associated with the comment.
      # @param is_private [Boolean] Whether or not the comment is internal.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::CommentRequest]
      def initialize(user: nil, contact: nil, body: nil, html_body: nil, ticket: nil, is_private: nil,
                     integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [Ticketing::CommentRequestUser] The author of the Comment, if the author is a User.
        @user = user
        # @type [Ticketing::CommentRequestContact] The author of the Comment, if the author is a Contact.
        @contact = contact
        # @type [String] The comment's text body.
        @body = body
        # @type [String] The comment's text body formatted as html.
        @html_body = html_body
        # @type [Ticketing::CommentRequestTicket] The ticket associated with the comment.
        @ticket = ticket
        # @type [Boolean] Whether or not the comment is internal.
        @is_private = is_private
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CommentRequest
      #
      # @param json_object [JSON]
      # @return [Ticketing::CommentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Ticketing::CommentRequestUser.from_json(json_object: user)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Ticketing::CommentRequestContact.from_json(json_object: contact)
        end
        body = struct.body
        html_body = struct.html_body
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Ticketing::CommentRequestTicket.from_json(json_object: ticket)
        end
        is_private = struct.is_private
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(user: user, contact: contact, body: body, html_body: html_body, ticket: ticket, is_private: is_private,
            integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of CommentRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "user": @user,
          "contact": @contact,
          "body": @body,
          "html_body": @html_body,
          "ticket": @ticket,
          "is_private": @is_private,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user.nil? || Ticketing::CommentRequestUser.validate_raw(obj: obj.user)
        obj.contact.nil? || Ticketing::CommentRequestContact.validate_raw(obj: obj.contact)
        obj.body&.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.html_body&.is_a?(String) != false || raise("Passed value for field obj.html_body is not the expected type, validation failed.")
        obj.ticket.nil? || Ticketing::CommentRequestTicket.validate_raw(obj: obj.ticket)
        obj.is_private&.is_a?(Boolean) != false || raise("Passed value for field obj.is_private is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
