# frozen_string_literal: true

require_relative "response_type_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The RemoteResponse Object
    #  ### Description
    #  The `RemoteResponse` object is used to represent information returned from a
    #  third-party endpoint.
    #  ### Usage Example
    #  View the `RemoteResponse` returned from your `DataPassthrough`.
    class RemoteResponse
      # @return [String]
      attr_reader :method
      # @return [String]
      attr_reader :path
      # @return [Integer]
      attr_reader :status
      # @return [Object]
      attr_reader :response
      # @return [Hash{String => Object}]
      attr_reader :response_headers
      # @return [Merge::Crm::ResponseTypeEnum]
      attr_reader :response_type
      # @return [Hash{String => Object}]
      attr_reader :headers
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param method [String]
      # @param path [String]
      # @param status [Integer]
      # @param response [Object]
      # @param response_headers [Hash{String => Object}]
      # @param response_type [Merge::Crm::ResponseTypeEnum]
      # @param headers [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::RemoteResponse]
      def initialize(method:, path:, status:, response:, response_headers: OMIT, response_type: OMIT, headers: OMIT,
                     additional_properties: nil)
        @method = method
        @path = path
        @status = status
        @response = response
        @response_headers = response_headers if response_headers != OMIT
        @response_type = response_type if response_type != OMIT
        @headers = headers if headers != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "method": method,
          "path": path,
          "status": status,
          "response": response,
          "response_headers": response_headers,
          "response_type": response_type,
          "headers": headers
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteResponse
      #
      # @param json_object [String]
      # @return [Merge::Crm::RemoteResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        method = struct["method"]
        path = struct["path"]
        status = struct["status"]
        response = struct["response"]
        response_headers = struct["response_headers"]
        response_type = struct["response_type"]
        headers = struct["headers"]
        new(
          method: method,
          path: path,
          status: status,
          response: response,
          response_headers: response_headers,
          response_type: response_type,
          headers: headers,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteResponse to a JSON object
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
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.status.is_a?(Integer) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.response.is_a?(Object) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
        obj.response_headers&.is_a?(Hash) != false || raise("Passed value for field obj.response_headers is not the expected type, validation failed.")
        obj.response_type&.is_a?(Merge::Crm::ResponseTypeEnum) != false || raise("Passed value for field obj.response_type is not the expected type, validation failed.")
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      end
    end
  end
end
