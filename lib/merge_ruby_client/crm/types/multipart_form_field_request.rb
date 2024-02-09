# frozen_string_literal: true

require_relative "encoding_enum"
require "json"

module Merge
  module Crm
    # # The MultipartFormField Object
    #
    # ### Description
    #
    # The `MultipartFormField` object is used to represent fields in an HTTP request using `multipart/form-data`.
    #
    # ### Usage Example
    #
    # Create a `MultipartFormField` to define a multipart form entry.
    class MultipartFormFieldRequest
      attr_reader :name, :data, :encoding, :file_name, :content_type, :additional_properties

      # @param name [String] The name of the form field
      # @param data [String] The data for the form field.
      # @param encoding [ENCODING_ENUM] The encoding of the value of `data`. Defaults to `RAW` if not defined.
      #   - `RAW` - RAW
      #   - `BASE64` - BASE64
      #   - `GZIP_BASE64` - GZIP_BASE64
      # @param file_name [String] The file name of the form field, if the field is for a file.
      # @param content_type [String] The MIME type of the file, if the field is for a file.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::MultipartFormFieldRequest]
      def initialize(name:, data:, encoding: nil, file_name: nil, content_type: nil, additional_properties: nil)
        # @type [String] The name of the form field
        @name = name
        # @type [String] The data for the form field.
        @data = data
        # @type [ENCODING_ENUM] The encoding of the value of `data`. Defaults to `RAW` if not defined.
        #   - `RAW` - RAW
        #   - `BASE64` - BASE64
        #   - `GZIP_BASE64` - GZIP_BASE64
        @encoding = encoding
        # @type [String] The file name of the form field, if the field is for a file.
        @file_name = file_name
        # @type [String] The MIME type of the file, if the field is for a file.
        @content_type = content_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MultipartFormFieldRequest
      #
      # @param json_object [JSON]
      # @return [Crm::MultipartFormFieldRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        data = struct.data
        encoding = Crm::ENCODING_ENUM.key(parsed_json["encoding"]) || parsed_json["encoding"]
        file_name = struct.file_name
        content_type = struct.content_type
        new(name: name, data: data, encoding: encoding, file_name: file_name, content_type: content_type,
            additional_properties: struct)
      end

      # Serialize an instance of MultipartFormFieldRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "name": @name,
          "data": @data,
          "encoding": Crm::ENCODING_ENUM[@encoding] || @encoding,
          "file_name": @file_name,
          "content_type": @content_type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.data.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.encoding&.is_a?(Crm::ENCODING_ENUM) != false || raise("Passed value for field obj.encoding is not the expected type, validation failed.")
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
      end
    end
  end
end
