# frozen_string_literal: true

require_relative "method_enum"
require_relative "multipart_form_field_request"
require_relative "request_format_enum"
require "json"

module Merge
  module Accounting
    # # The DataPassthrough Object
    #
    # ### Description
    #
    # The `DataPassthrough` object is used to send information to an otherwise-unsupported third-party endpoint.
    #
    # ### Usage Example
    #
    # Create a `DataPassthrough` to get team hierarchies from your Rippling integration.
    class DataPassthroughRequest
      attr_reader :method, :path, :base_url_override, :data, :multipart_form_data, :headers, :request_format,
                  :normalize_response, :additional_properties

      # @param method [METHOD_ENUM]
      # @param path [String]
      # @param base_url_override [String]
      # @param data [String]
      # @param multipart_form_data [Array<Accounting::MultipartFormFieldRequest>] Pass an array of `MultipartFormField` objects in here instead of using the `data` param if `request_format` is set to `MULTIPART`.
      # @param headers [Hash{String => String}] The headers to use for the request (Merge will handle the account's authorization headers). `Content-Type` header is required for passthrough. Choose content type corresponding to expected format of receiving server.
      # @param request_format [REQUEST_FORMAT_ENUM]
      # @param normalize_response [Boolean] Optional. If true, the response will always be an object of the form `{"type": T, "value": ...}` where `T` will be one of `string, boolean, number, null, array, object`.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::DataPassthroughRequest]
      def initialize(method:, path:, base_url_override: nil, data: nil, multipart_form_data: nil, headers: nil,
                     request_format: nil, normalize_response: nil, additional_properties: nil)
        # @type [METHOD_ENUM]
        @method = method
        # @type [String]
        @path = path
        # @type [String]
        @base_url_override = base_url_override
        # @type [String]
        @data = data
        # @type [Array<Accounting::MultipartFormFieldRequest>] Pass an array of `MultipartFormField` objects in here instead of using the `data` param if `request_format` is set to `MULTIPART`.
        @multipart_form_data = multipart_form_data
        # @type [Hash{String => String}] The headers to use for the request (Merge will handle the account's authorization headers). `Content-Type` header is required for passthrough. Choose content type corresponding to expected format of receiving server.
        @headers = headers
        # @type [REQUEST_FORMAT_ENUM]
        @request_format = request_format
        # @type [Boolean] Optional. If true, the response will always be an object of the form `{"type": T, "value": ...}` where `T` will be one of `string, boolean, number, null, array, object`.
        @normalize_response = normalize_response
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of DataPassthroughRequest
      #
      # @param json_object [JSON]
      # @return [Accounting::DataPassthroughRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method = Accounting::METHOD_ENUM.key(parsed_json["method"]) || parsed_json["method"]
        path = struct.path
        base_url_override = struct.base_url_override
        data = struct.data
        multipart_form_data = parsed_json["multipart_form_data"]&.map do |v|
          v = v.to_json
          Accounting::MultipartFormFieldRequest.from_json(json_object: v)
        end
        headers = struct.headers
        request_format = Accounting::REQUEST_FORMAT_ENUM.key(parsed_json["request_format"]) || parsed_json["request_format"]
        normalize_response = struct.normalize_response
        new(method: method, path: path, base_url_override: base_url_override, data: data,
            multipart_form_data: multipart_form_data, headers: headers, request_format: request_format, normalize_response: normalize_response, additional_properties: struct)
      end

      # Serialize an instance of DataPassthroughRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "method": Accounting::METHOD_ENUM[@method] || @method,
          "path": @path,
          "base_url_override": @base_url_override,
          "data": @data,
          "multipart_form_data": @multipart_form_data,
          "headers": @headers,
          "request_format": Accounting::REQUEST_FORMAT_ENUM[@request_format] || @request_format,
          "normalize_response": @normalize_response
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.method.is_a?(Accounting::METHOD_ENUM) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.base_url_override&.is_a?(String) != false || raise("Passed value for field obj.base_url_override is not the expected type, validation failed.")
        obj.data&.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.multipart_form_data&.is_a?(Array) != false || raise("Passed value for field obj.multipart_form_data is not the expected type, validation failed.")
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
        obj.request_format&.is_a?(Accounting::REQUEST_FORMAT_ENUM) != false || raise("Passed value for field obj.request_format is not the expected type, validation failed.")
        obj.normalize_response&.is_a?(Boolean) != false || raise("Passed value for field obj.normalize_response is not the expected type, validation failed.")
      end
    end
  end
end
