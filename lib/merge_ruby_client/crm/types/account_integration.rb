# frozen_string_literal: true

require_relative "categories_enum"
require "json"

module Merge
  module Crm
    class AccountIntegration
      attr_reader :name, :categories, :image, :square_image, :color, :slug, :is_in_beta,
                  :api_endpoints_to_documentation_urls, :webhook_setup_guide_url, :additional_properties

      # @param name [String] Company name.
      # @param categories [Array<Crm::CATEGORIES_ENUM>] Category or categories this integration belongs to. Multiple categories should be comma separated, i.e. [ats, hris].
      # @param image [String] Company logo in rectangular shape. <b>Upload an image with a clear background.</b>
      # @param square_image [String] Company logo in square shape. <b>Upload an image with a white background.</b>
      # @param color [String] The color of this integration used for buttons and text throughout the app and landing pages. <b>Choose a darker, saturated color.</b>
      # @param slug [String]
      # @param is_in_beta [Boolean] If checked, this integration will not appear in the linking flow, and will appear elsewhere with a Beta tag.
      # @param api_endpoints_to_documentation_urls [Hash{String => String}] Mapping of API endpoints to documentation urls for support. Example: {'GET': [['/common-model-scopes', 'https://docs.merge.dev/accounting/common-model-scopes/#common_model_scopes_retrieve'],['/common-model-actions', 'https://docs.merge.dev/accounting/common-model-actions/#common_model_actions_retrieve']], 'POST': []}
      # @param webhook_setup_guide_url [String] Setup guide URL for third party webhook creation. Exposed in Merge Docs.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AccountIntegration]
      def initialize(name:, categories: nil, image: nil, square_image: nil, color: nil, slug: nil, is_in_beta: nil,
                     api_endpoints_to_documentation_urls: nil, webhook_setup_guide_url: nil, additional_properties: nil)
        # @type [String] Company name.
        @name = name
        # @type [Array<Crm::CATEGORIES_ENUM>] Category or categories this integration belongs to. Multiple categories should be comma separated, i.e. [ats, hris].
        @categories = categories
        # @type [String] Company logo in rectangular shape. <b>Upload an image with a clear background.</b>
        @image = image
        # @type [String] Company logo in square shape. <b>Upload an image with a white background.</b>
        @square_image = square_image
        # @type [String] The color of this integration used for buttons and text throughout the app and landing pages. <b>Choose a darker, saturated color.</b>
        @color = color
        # @type [String]
        @slug = slug
        # @type [Boolean] If checked, this integration will not appear in the linking flow, and will appear elsewhere with a Beta tag.
        @is_in_beta = is_in_beta
        # @type [Hash{String => String}] Mapping of API endpoints to documentation urls for support. Example: {'GET': [['/common-model-scopes', 'https://docs.merge.dev/accounting/common-model-scopes/#common_model_scopes_retrieve'],['/common-model-actions', 'https://docs.merge.dev/accounting/common-model-actions/#common_model_actions_retrieve']], 'POST': []}
        @api_endpoints_to_documentation_urls = api_endpoints_to_documentation_urls
        # @type [String] Setup guide URL for third party webhook creation. Exposed in Merge Docs.
        @webhook_setup_guide_url = webhook_setup_guide_url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountIntegration
      #
      # @param json_object [JSON]
      # @return [Crm::AccountIntegration]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        categories = parsed_json["categories"]&.map do |v|
          v = v.to_json
          Crm::CATEGORIES_ENUM.key(v) || v
        end
        image = struct.image
        square_image = struct.square_image
        color = struct.color
        slug = struct.slug
        is_in_beta = struct.is_in_beta
        api_endpoints_to_documentation_urls = struct.api_endpoints_to_documentation_urls
        webhook_setup_guide_url = struct.webhook_setup_guide_url
        new(name: name, categories: categories, image: image, square_image: square_image, color: color, slug: slug,
            is_in_beta: is_in_beta, api_endpoints_to_documentation_urls: api_endpoints_to_documentation_urls, webhook_setup_guide_url: webhook_setup_guide_url, additional_properties: struct)
      end

      # Serialize an instance of AccountIntegration to a JSON object
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
          "is_in_beta": @is_in_beta,
          "api_endpoints_to_documentation_urls": @api_endpoints_to_documentation_urls,
          "webhook_setup_guide_url": @webhook_setup_guide_url
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.categories&.is_a?(Array) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.image&.is_a?(String) != false || raise("Passed value for field obj.image is not the expected type, validation failed.")
        obj.square_image&.is_a?(String) != false || raise("Passed value for field obj.square_image is not the expected type, validation failed.")
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.is_in_beta&.is_a?(Boolean) != false || raise("Passed value for field obj.is_in_beta is not the expected type, validation failed.")
        obj.api_endpoints_to_documentation_urls&.is_a?(Hash) != false || raise("Passed value for field obj.api_endpoints_to_documentation_urls is not the expected type, validation failed.")
        obj.webhook_setup_guide_url&.is_a?(String) != false || raise("Passed value for field obj.webhook_setup_guide_url is not the expected type, validation failed.")
      end
    end
  end
end
