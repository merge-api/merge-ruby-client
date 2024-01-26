# frozen_string_literal: true
require_relative "remote_response_response_type"
require "json"

module Merge
  module Hris
    # # The RemoteResponse Object 
### Description

The `RemoteResponse` object is used to represent information returned from a third-party endpoint.

### Usage Example

View the `RemoteResponse` returned from your `DataPassthrough`.
    class RemoteResponse
      attr_reader :method, :path, :status, :response, :response_headers, :response_type, :headers, :additional_properties
      # @param method [String] 
      # @param path [String] 
      # @param status [Integer] 
      # @param response [Object] 
      # @param response_headers [Hash{String => String}] 
      # @param response_type [Hris::RemoteResponseResponseType] 
      # @param headers [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::RemoteResponse]
      def initialize(method:, path:, status:, response:, response_headers: nil, response_type: nil, headers: nil, additional_properties: nil)
        # @type [String] 
        @method = method
        # @type [String] 
        @path = path
        # @type [Integer] 
        @status = status
        # @type [Object] 
        @response = response
        # @type [Hash{String => String}] 
        @response_headers = response_headers
        # @type [Hris::RemoteResponseResponseType] 
        @response_type = response_type
        # @type [Hash{String => String}] 
        @headers = headers
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of RemoteResponse
      #
      # @param json_object [JSON] 
      # @return [Hris::RemoteResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        method = struct.method
        path = struct.path
        status = struct.status
        response = struct.response
        response_headers = struct.response_headers
        response_type = struct.response_type.to_h.to_json()
        response_type = Hris::RemoteResponseResponseType.from_json(json_object: response_type)
        headers = struct.headers
        new(method: method, path: path, status: status, response: response, response_headers: response_headers, response_type: response_type, headers: headers, additional_properties: struct)
      end
      # Serialize an instance of RemoteResponse to a JSON object
      #
      # @return [JSON]
      def to_json
        { "method": @method, "path": @path, "status": @status, "response": @response, "response_headers": @response_headers, "response_type": @response_type, "headers": @headers }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.method.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.status.is_a?(Integer) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.response.is_a?(Object) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
        obj.response_headers&.is_a?(Hash) != false || raise("Passed value for field obj.response_headers is not the expected type, validation failed.")
        obj.response_type.nil?() || Hris::RemoteResponseResponseType.validate_raw(obj: obj.response_type)
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      end
    end
  end
end