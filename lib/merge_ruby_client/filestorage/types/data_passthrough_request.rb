# frozen_string_literal: true

require_relative "method_enum"
require_relative "multipart_form_field_request"
require_relative "request_format_enum"
require "ostruct"
require "json"

module Merge
  module Filestorage
    # # The DataPassthrough Object
    #  ### Description
    #  The `DataPassthrough` object is used to send information to an
    #  otherwise-unsupported third-party endpoint.
    #  ### Usage Example
    #  Create a `DataPassthrough` to get team hierarchies from your Rippling
    #  integration.
    class DataPassthroughRequest
      # @return [Merge::Filestorage::MethodEnum]
      attr_reader :method
      # @return [String] The path of the request in the third party's platform.
      attr_reader :path
      # @return [String] An optional override of the third party's base url for the request.
      attr_reader :base_url_override
      # @return [String] The data with the request. You must include a `request_format` parameter
      #  matching the data's format
      attr_reader :data
      # @return [Array<Merge::Filestorage::MultipartFormFieldRequest>] Pass an array of `MultipartFormField` objects in here instead of using the
      #  `data` param if `request_format` is set to `MULTIPART`.
      attr_reader :multipart_form_data
      # @return [Hash{String => Object}] The headers to use for the request (Merge will handle the account's
      #  authorization headers). `Content-Type` header is required for passthrough.
      #  Choose content type corresponding to expected format of receiving server.
      attr_reader :headers
      # @return [Merge::Filestorage::RequestFormatEnum]
      attr_reader :request_format
      # @return [Boolean] Optional. If true, the response will always be an object of the form `{"type":
      #  T, "value": ...}` where `T` will be one of `string, boolean, number, null,
      #  array, object`.
      attr_reader :normalize_response
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param method [Merge::Filestorage::MethodEnum]
      # @param path [String] The path of the request in the third party's platform.
      # @param base_url_override [String] An optional override of the third party's base url for the request.
      # @param data [String] The data with the request. You must include a `request_format` parameter
      #  matching the data's format
      # @param multipart_form_data [Array<Merge::Filestorage::MultipartFormFieldRequest>] Pass an array of `MultipartFormField` objects in here instead of using the
      #  `data` param if `request_format` is set to `MULTIPART`.
      # @param headers [Hash{String => Object}] The headers to use for the request (Merge will handle the account's
      #  authorization headers). `Content-Type` header is required for passthrough.
      #  Choose content type corresponding to expected format of receiving server.
      # @param request_format [Merge::Filestorage::RequestFormatEnum]
      # @param normalize_response [Boolean] Optional. If true, the response will always be an object of the form `{"type":
      #  T, "value": ...}` where `T` will be one of `string, boolean, number, null,
      #  array, object`.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::DataPassthroughRequest]
      def initialize(method:, path:, base_url_override: OMIT, data: OMIT, multipart_form_data: OMIT, headers: OMIT,
                     request_format: OMIT, normalize_response: OMIT, additional_properties: nil)
        @method = method
        @path = path
        @base_url_override = base_url_override if base_url_override != OMIT
        @data = data if data != OMIT
        @multipart_form_data = multipart_form_data if multipart_form_data != OMIT
        @headers = headers if headers != OMIT
        @request_format = request_format if request_format != OMIT
        @normalize_response = normalize_response if normalize_response != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "method": method,
          "path": path,
          "base_url_override": base_url_override,
          "data": data,
          "multipart_form_data": multipart_form_data,
          "headers": headers,
          "request_format": request_format,
          "normalize_response": normalize_response
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of DataPassthroughRequest
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::DataPassthroughRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method = parsed_json["method"]
        path = parsed_json["path"]
        base_url_override = parsed_json["base_url_override"]
        data = parsed_json["data"]
        multipart_form_data = parsed_json["multipart_form_data"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::MultipartFormFieldRequest.from_json(json_object: item)
        end
        headers = parsed_json["headers"]
        request_format = parsed_json["request_format"]
        normalize_response = parsed_json["normalize_response"]
        new(
          method: method,
          path: path,
          base_url_override: base_url_override,
          data: data,
          multipart_form_data: multipart_form_data,
          headers: headers,
          request_format: request_format,
          normalize_response: normalize_response,
          additional_properties: struct
        )
      end

      # Serialize an instance of DataPassthroughRequest to a JSON object
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
        obj.method.is_a?(Merge::Filestorage::MethodEnum) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.base_url_override&.is_a?(String) != false || raise("Passed value for field obj.base_url_override is not the expected type, validation failed.")
        obj.data&.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.multipart_form_data&.is_a?(Array) != false || raise("Passed value for field obj.multipart_form_data is not the expected type, validation failed.")
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
        obj.request_format&.is_a?(Merge::Filestorage::RequestFormatEnum) != false || raise("Passed value for field obj.request_format is not the expected type, validation failed.")
        obj.normalize_response&.is_a?(Boolean) != false || raise("Passed value for field obj.normalize_response is not the expected type, validation failed.")
      end
    end
  end
end
