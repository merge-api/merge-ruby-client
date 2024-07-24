# frozen_string_literal: true

require_relative "categories_enum"
require_relative "model_operation"
require "ostruct"
require "json"

module Merge
  module Hris
    class AccountDetailsAndActionsIntegration
      # @return [String]
      attr_reader :name
      # @return [Array<Merge::Hris::CategoriesEnum>]
      attr_reader :categories
      # @return [String]
      attr_reader :image
      # @return [String]
      attr_reader :square_image
      # @return [String]
      attr_reader :color
      # @return [String]
      attr_reader :slug
      # @return [Boolean]
      attr_reader :passthrough_available
      # @return [Array<Merge::Hris::ModelOperation>]
      attr_reader :available_model_operations
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String]
      # @param categories [Array<Merge::Hris::CategoriesEnum>]
      # @param image [String]
      # @param square_image [String]
      # @param color [String]
      # @param slug [String]
      # @param passthrough_available [Boolean]
      # @param available_model_operations [Array<Merge::Hris::ModelOperation>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::AccountDetailsAndActionsIntegration]
      def initialize(name:, categories:, color:, slug:, passthrough_available:, image: OMIT, square_image: OMIT,
                     available_model_operations: OMIT, additional_properties: nil)
        @name = name
        @categories = categories
        @image = image if image != OMIT
        @square_image = square_image if square_image != OMIT
        @color = color
        @slug = slug
        @passthrough_available = passthrough_available
        @available_model_operations = available_model_operations if available_model_operations != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "categories": categories,
          "image": image,
          "square_image": square_image,
          "color": color,
          "slug": slug,
          "passthrough_available": passthrough_available,
          "available_model_operations": available_model_operations
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountDetailsAndActionsIntegration
      #
      # @param json_object [String]
      # @return [Merge::Hris::AccountDetailsAndActionsIntegration]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        categories = parsed_json["categories"]
        image = parsed_json["image"]
        square_image = parsed_json["square_image"]
        color = parsed_json["color"]
        slug = parsed_json["slug"]
        passthrough_available = parsed_json["passthrough_available"]
        available_model_operations = parsed_json["available_model_operations"]&.map do |item|
          item = item.to_json
          Merge::Hris::ModelOperation.from_json(json_object: item)
        end
        new(
          name: name,
          categories: categories,
          image: image,
          square_image: square_image,
          color: color,
          slug: slug,
          passthrough_available: passthrough_available,
          available_model_operations: available_model_operations,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountDetailsAndActionsIntegration to a JSON object
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
