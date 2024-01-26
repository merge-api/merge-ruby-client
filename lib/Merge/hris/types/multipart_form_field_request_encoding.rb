# frozen_string_literal: true

require "json"

module Merge
  module Hris
    # The encoding of the value of `data`. Defaults to `RAW` if not defined.
    `RAW`
    `BASE64`
    `GZIP_BASE64`
    class MultipartFormFieldRequestEncoding
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object]
      # @return [Hris::MultipartFormFieldRequestEncoding]
      def initialize(member:)
        # @type [Object]
        @member = member
      end

      # Deserialize a JSON object to an instance of MultipartFormFieldRequestEncoding
      #
      # @param json_object [JSON]
      # @return [Hris::MultipartFormFieldRequestEncoding]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(ENCODING_ENUM) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = ENCODING_ENUM.key(json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = json_object
          return new(member: member)
        rescue StandardError
          # noop
        end
        new(member: struct)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return obj.is_a?(ENCODING_ENUM) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
    end
  end
end
