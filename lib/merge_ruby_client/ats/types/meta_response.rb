# frozen_string_literal: true

require_relative "linked_account_status"
require "ostruct"
require "json"

module Merge
  module Ats
    class MetaResponse
      # @return [Hash{String => Object}]
      attr_reader :request_schema
      # @return [Hash{String => Object}]
      attr_reader :remote_field_classes
      # @return [Merge::Ats::LinkedAccountStatus]
      attr_reader :status
      # @return [Boolean]
      attr_reader :has_conditional_params
      # @return [Boolean]
      attr_reader :has_required_linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param request_schema [Hash{String => Object}]
      # @param remote_field_classes [Hash{String => Object}]
      # @param status [Merge::Ats::LinkedAccountStatus]
      # @param has_conditional_params [Boolean]
      # @param has_required_linked_account_params [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::MetaResponse]
      def initialize(request_schema:, has_conditional_params:, has_required_linked_account_params:,
                     remote_field_classes: OMIT, status: OMIT, additional_properties: nil)
        @request_schema = request_schema
        @remote_field_classes = remote_field_classes if remote_field_classes != OMIT
        @status = status if status != OMIT
        @has_conditional_params = has_conditional_params
        @has_required_linked_account_params = has_required_linked_account_params
        @additional_properties = additional_properties
        @_field_set = {
          "request_schema": request_schema,
          "remote_field_classes": remote_field_classes,
          "status": status,
          "has_conditional_params": has_conditional_params,
          "has_required_linked_account_params": has_required_linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MetaResponse
      #
      # @param json_object [String]
      # @return [Merge::Ats::MetaResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        request_schema = parsed_json["request_schema"]
        remote_field_classes = parsed_json["remote_field_classes"]
        if parsed_json["status"].nil?
          status = nil
        else
          status = parsed_json["status"].to_json
          status = Merge::Ats::LinkedAccountStatus.from_json(json_object: status)
        end
        has_conditional_params = parsed_json["has_conditional_params"]
        has_required_linked_account_params = parsed_json["has_required_linked_account_params"]
        new(
          request_schema: request_schema,
          remote_field_classes: remote_field_classes,
          status: status,
          has_conditional_params: has_conditional_params,
          has_required_linked_account_params: has_required_linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of MetaResponse to a JSON object
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
        obj.request_schema.is_a?(Hash) != false || raise("Passed value for field obj.request_schema is not the expected type, validation failed.")
        obj.remote_field_classes&.is_a?(Hash) != false || raise("Passed value for field obj.remote_field_classes is not the expected type, validation failed.")
        obj.status.nil? || Merge::Ats::LinkedAccountStatus.validate_raw(obj: obj.status)
        obj.has_conditional_params.is_a?(Boolean) != false || raise("Passed value for field obj.has_conditional_params is not the expected type, validation failed.")
        obj.has_required_linked_account_params.is_a?(Boolean) != false || raise("Passed value for field obj.has_required_linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
