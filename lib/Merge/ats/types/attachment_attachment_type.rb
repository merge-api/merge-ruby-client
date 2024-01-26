# frozen_string_literal: true

require "json"

module Merge
  module Ats
    # The attachment's type.
    `RESUME`
    `COVER_LETTER`
    `OFFER_LETTER`
    `OTHER`
    class AttachmentAttachmentType
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object]
      # @return [Ats::AttachmentAttachmentType]
      def initialize(member:)
        # @type [Object]
        @member = member
      end

      # Deserialize a JSON object to an instance of AttachmentAttachmentType
      #
      # @param json_object [JSON]
      # @return [Ats::AttachmentAttachmentType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(ATTACHMENT_TYPE_ENUM) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = ATTACHMENT_TYPE_ENUM.key(json_object)
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
          return obj.is_a?(ATTACHMENT_TYPE_ENUM) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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
