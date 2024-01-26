# frozen_string_literal: true

require_relative "linked_account_status"
require "json"

module Merge
  module Crm
    class MetaResponse
      attr_reader :request_schema, :remote_field_classes, :status, :has_conditional_params,
                  :has_required_linked_account_params, :additional_properties

      # @param request_schema [Hash{String => String}]
      # @param remote_field_classes [Hash{String => String}]
      # @param status [Crm::LinkedAccountStatus]
      # @param has_conditional_params [Boolean]
      # @param has_required_linked_account_params [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::MetaResponse]
      def initialize(request_schema:, has_conditional_params:, has_required_linked_account_params:,
                     remote_field_classes: nil, status: nil, additional_properties: nil)
        # @type [Hash{String => String}]
        @request_schema = request_schema
        # @type [Hash{String => String}]
        @remote_field_classes = remote_field_classes
        # @type [Crm::LinkedAccountStatus]
        @status = status
        # @type [Boolean]
        @has_conditional_params = has_conditional_params
        # @type [Boolean]
        @has_required_linked_account_params = has_required_linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MetaResponse
      #
      # @param json_object [JSON]
      # @return [Crm::MetaResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        request_schema = struct.request_schema
        remote_field_classes = struct.remote_field_classes
        status = struct.status.to_h.to_json
        status = Crm::LinkedAccountStatus.from_json(json_object: status)
        has_conditional_params = struct.has_conditional_params
        has_required_linked_account_params = struct.has_required_linked_account_params
        new(request_schema: request_schema, remote_field_classes: remote_field_classes, status: status,
            has_conditional_params: has_conditional_params, has_required_linked_account_params: has_required_linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of MetaResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "request_schema": @request_schema,
          "remote_field_classes": @remote_field_classes,
          "status": @status,
          "has_conditional_params": @has_conditional_params,
          "has_required_linked_account_params": @has_required_linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.request_schema.is_a?(Hash) != false || raise("Passed value for field obj.request_schema is not the expected type, validation failed.")
        obj.remote_field_classes&.is_a?(Hash) != false || raise("Passed value for field obj.remote_field_classes is not the expected type, validation failed.")
        obj.status.nil? || Crm::LinkedAccountStatus.validate_raw(obj: obj.status)
        obj.has_conditional_params.is_a?(Boolean) != false || raise("Passed value for field obj.has_conditional_params is not the expected type, validation failed.")
        obj.has_required_linked_account_params.is_a?(Boolean) != false || raise("Passed value for field obj.has_required_linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
