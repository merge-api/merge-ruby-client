# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Basics
    class IntegrationMetadata
      # @return [String]
      attr_reader :name
      # @return [String]
      attr_reader :slug
      # @return [String]
      attr_reader :image
      # @return [String]
      attr_reader :square_image
      # @return [String]
      attr_reader :color
      # @return [Array<String>]
      attr_reader :categories
      # @return [Array<String>]
      attr_reader :enabled_categories
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String]
      # @param slug [String]
      # @param image [String]
      # @param square_image [String]
      # @param color [String]
      # @param categories [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Basics::IntegrationMetadata]
      def initialize(name: OMIT, slug: OMIT, image: OMIT, square_image: OMIT, color: OMIT, categories: OMIT, enabled_categories: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @slug = slug if slug != OMIT
        @image = image if image != OMIT
        @square_image = square_image if square_image != OMIT
        @color = color if color != OMIT
        @categories = categories if categories != OMIT
        @enabled_categories = enabled_categories if enabled_categories != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "slug": slug,
          "image": image,
          "square_image": square_image,
          "color": color,
          "categories": categories,
          "enabled_categories": enabled_categories
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of IntegrationMetadata
      #
      # @param json_object [String]
      # @return [Merge::Basics::IntegrationMetadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        slug = parsed_json["slug"]
        image = parsed_json["image"]
        square_image = parsed_json["square_image"]
        color = parsed_json["color"]
        categories = parsed_json["categories"]
        enabled_categories = parsed_json["enabled_categories"]
        additional_properties = struct.to_h.reject { |k, _| %w[name slug image square_image color categories].include?(k) }
        new(
          name: name,
          slug: slug,
          image: image,
          square_image: square_image,
          color: color,
          categories: categories,
          enabled_categories: enabled_categories,
          additional_properties: OpenStruct.new(additional_properties)
        )
      end

      # Serialize an instance of IntegrationMetadata to a JSON object
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
        # TODO: Implement validation
      end
    end
  end
end
