# frozen_string_literal: true

require_relative "encoding_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The MultipartFormField Object
    #  ### Description
    #  The `MultipartFormField` object is used to represent fields in an HTTP request
    #  using `multipart/form-data`.
    #  ### Usage Example
    #  Create a `MultipartFormField` to define a multipart form entry.
    class MultipartFormFieldRequest
      # @return [String] The name of the form field
      attr_reader :name
      # @return [String] The data for the form field.
      attr_reader :data
      # @return [Merge::Accounting::EncodingEnum] The encoding of the value of `data`. Defaults to `RAW` if not defined.
      #  * `RAW` - RAW
      #  * `BASE64` - BASE64
      #  * `GZIP_BASE64` - GZIP_BASE64
      attr_reader :encoding
      # @return [String] The file name of the form field, if the field is for a file.
      attr_reader :file_name
      # @return [String] The MIME type of the file, if the field is for a file.
      attr_reader :content_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] The name of the form field
      # @param data [String] The data for the form field.
      # @param encoding [Merge::Accounting::EncodingEnum] The encoding of the value of `data`. Defaults to `RAW` if not defined.
      #  * `RAW` - RAW
      #  * `BASE64` - BASE64
      #  * `GZIP_BASE64` - GZIP_BASE64
      # @param file_name [String] The file name of the form field, if the field is for a file.
      # @param content_type [String] The MIME type of the file, if the field is for a file.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::MultipartFormFieldRequest]
      def initialize(name:, data:, encoding: OMIT, file_name: OMIT, content_type: OMIT, additional_properties: nil)
        @name = name
        @data = data
        @encoding = encoding if encoding != OMIT
        @file_name = file_name if file_name != OMIT
        @content_type = content_type if content_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "data": data,
          "encoding": encoding,
          "file_name": file_name,
          "content_type": content_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MultipartFormFieldRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::MultipartFormFieldRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        data = parsed_json["data"]
        encoding = parsed_json["encoding"]
        file_name = parsed_json["file_name"]
        content_type = parsed_json["content_type"]
        new(
          name: name,
          data: data,
          encoding: encoding,
          file_name: file_name,
          content_type: content_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of MultipartFormFieldRequest to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.data.is_a?(String) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.encoding&.is_a?(Merge::Accounting::EncodingEnum) != false || raise("Passed value for field obj.encoding is not the expected type, validation failed.")
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
      end
    end
  end
end
