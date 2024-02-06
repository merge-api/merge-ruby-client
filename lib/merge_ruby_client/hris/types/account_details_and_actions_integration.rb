# frozen_string_literal: true

require_relative "categories_enum"
require_relative "model_operation"
require "json"

module Merge
  module Hris
    class AccountDetailsAndActionsIntegration
      attr_reader :name, :categories, :image, :square_image, :color, :slug, :passthrough_available,
                  :available_model_operations, :additional_properties

      # @param name [String]
      # @param categories [Array<Hris::CATEGORIES_ENUM>]
      # @param image [String]
      # @param square_image [String]
      # @param color [String]
      # @param slug [String]
      # @param passthrough_available [Boolean]
      # @param available_model_operations [Array<Hris::ModelOperation>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::AccountDetailsAndActionsIntegration]
      def initialize(name:, categories:, color:, slug:, passthrough_available:, image: nil, square_image: nil,
                     available_model_operations: nil, additional_properties: nil)
        # @type [String]
        @name = name
        # @type [Array<Hris::CATEGORIES_ENUM>]
        @categories = categories
        # @type [String]
        @image = image
        # @type [String]
        @square_image = square_image
        # @type [String]
        @color = color
        # @type [String]
        @slug = slug
        # @type [Boolean]
        @passthrough_available = passthrough_available
        # @type [Array<Hris::ModelOperation>]
        @available_model_operations = available_model_operations
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountDetailsAndActionsIntegration
      #
      # @param json_object [JSON]
      # @return [Hris::AccountDetailsAndActionsIntegration]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        categories = parsed_json["categories"]&.map do |v|
          v = v.to_json
          Hris::CATEGORIES_ENUM.key(v) || v
        end
        image = struct.image
        square_image = struct.square_image
        color = struct.color
        slug = struct.slug
        passthrough_available = struct.passthrough_available
        available_model_operations = parsed_json["available_model_operations"]&.map do |v|
          v = v.to_json
          Hris::ModelOperation.from_json(json_object: v)
        end
        new(name: name, categories: categories, image: image, square_image: square_image, color: color, slug: slug,
            passthrough_available: passthrough_available, available_model_operations: available_model_operations, additional_properties: struct)
      end

      # Serialize an instance of AccountDetailsAndActionsIntegration to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "name": @name,
          "categories": @categories,
          "image": @image,
          "square_image": @square_image,
          "color": @color,
          "slug": @slug,
          "passthrough_available": @passthrough_available,
          "available_model_operations": @available_model_operations
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.categories.is_a?(Array) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.image&.is_a?(String) != false || raise("Passed value for field obj.image is not the expected type, validation failed.")
        obj.square_image&.is_a?(String) != false || raise("Passed value for field obj.square_image is not the expected type, validation failed.")
        obj.color.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.slug.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.passthrough_available.is_a?(Boolean) != false || raise("Passed value for field obj.passthrough_available is not the expected type, validation failed.")
        obj.available_model_operations&.is_a?(Array) != false || raise("Passed value for field obj.available_model_operations is not the expected type, validation failed.")
      end
    end
  end
end
