# frozen_string_literal: true

require_relative "categories_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    class AccountIntegration
      # @return [String] Company name.
      attr_reader :name
      # @return [String] Optional. This shortened name appears in places with limited space, usually in
      #  conjunction with the platform's logo (e.g., Merge Link menu).<br><br>Example:
      #  <i>Workforce Now (in lieu of ADP Workforce Now), SuccessFactors (in lieu of SAP
      #  SuccessFactors)</i>
      attr_reader :abbreviated_name
      # @return [Array<Merge::Crm::CategoriesEnum>] Category or categories this integration belongs to. Multiple categories should
      #  be comma separated, i.e. [ats, hris].
      attr_reader :categories
      # @return [String] Company logo in rectangular shape.
      attr_reader :image
      # @return [String] Company logo in square shape.
      attr_reader :square_image
      # @return [String] The color of this integration used for buttons and text throughout the app and
      #  landing pages. <b>Choose a darker, saturated color.</b>
      attr_reader :color
      # @return [String]
      attr_reader :slug
      # @return [Hash{String => Object}] Mapping of API endpoints to documentation urls for support. Example: {'GET':
      #  [['/common-model-scopes',
      #  ng/common-model-scopes/#common_model_scopes_retrieve'],['/common-model-actions',
      #  ocs.merge.dev/accounting/common-model-actions/#common_model_actions_retrieve']],
      #  'POST': []}
      attr_reader :api_endpoints_to_documentation_urls
      # @return [String] Setup guide URL for third party webhook creation. Exposed in Merge Docs.
      attr_reader :webhook_setup_guide_url
      # @return [Hash{String => Object}] Category or categories this integration is in beta status for.
      attr_reader :category_beta_status
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Company name.
      # @param abbreviated_name [String] Optional. This shortened name appears in places with limited space, usually in
      #  conjunction with the platform's logo (e.g., Merge Link menu).<br><br>Example:
      #  <i>Workforce Now (in lieu of ADP Workforce Now), SuccessFactors (in lieu of SAP
      #  SuccessFactors)</i>
      # @param categories [Array<Merge::Crm::CategoriesEnum>] Category or categories this integration belongs to. Multiple categories should
      #  be comma separated, i.e. [ats, hris].
      # @param image [String] Company logo in rectangular shape.
      # @param square_image [String] Company logo in square shape.
      # @param color [String] The color of this integration used for buttons and text throughout the app and
      #  landing pages. <b>Choose a darker, saturated color.</b>
      # @param slug [String]
      # @param api_endpoints_to_documentation_urls [Hash{String => Object}] Mapping of API endpoints to documentation urls for support. Example: {'GET':
      #  [['/common-model-scopes',
      #  ng/common-model-scopes/#common_model_scopes_retrieve'],['/common-model-actions',
      #  ocs.merge.dev/accounting/common-model-actions/#common_model_actions_retrieve']],
      #  'POST': []}
      # @param webhook_setup_guide_url [String] Setup guide URL for third party webhook creation. Exposed in Merge Docs.
      # @param category_beta_status [Hash{String => Object}] Category or categories this integration is in beta status for.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AccountIntegration]
      def initialize(name:, abbreviated_name: OMIT, categories: OMIT, image: OMIT, square_image: OMIT, color: OMIT,
                     slug: OMIT, api_endpoints_to_documentation_urls: OMIT, webhook_setup_guide_url: OMIT, category_beta_status: OMIT, additional_properties: nil)
        @name = name
        @abbreviated_name = abbreviated_name if abbreviated_name != OMIT
        @categories = categories if categories != OMIT
        @image = image if image != OMIT
        @square_image = square_image if square_image != OMIT
        @color = color if color != OMIT
        @slug = slug if slug != OMIT
        if api_endpoints_to_documentation_urls != OMIT
          @api_endpoints_to_documentation_urls = api_endpoints_to_documentation_urls
        end
        @webhook_setup_guide_url = webhook_setup_guide_url if webhook_setup_guide_url != OMIT
        @category_beta_status = category_beta_status if category_beta_status != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "abbreviated_name": abbreviated_name,
          "categories": categories,
          "image": image,
          "square_image": square_image,
          "color": color,
          "slug": slug,
          "api_endpoints_to_documentation_urls": api_endpoints_to_documentation_urls,
          "webhook_setup_guide_url": webhook_setup_guide_url,
          "category_beta_status": category_beta_status
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountIntegration
      #
      # @param json_object [String]
      # @return [Merge::Crm::AccountIntegration]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        abbreviated_name = parsed_json["abbreviated_name"]
        categories = parsed_json["categories"]
        image = parsed_json["image"]
        square_image = parsed_json["square_image"]
        color = parsed_json["color"]
        slug = parsed_json["slug"]
        api_endpoints_to_documentation_urls = parsed_json["api_endpoints_to_documentation_urls"]
        webhook_setup_guide_url = parsed_json["webhook_setup_guide_url"]
        category_beta_status = parsed_json["category_beta_status"]
        new(
          name: name,
          abbreviated_name: abbreviated_name,
          categories: categories,
          image: image,
          square_image: square_image,
          color: color,
          slug: slug,
          api_endpoints_to_documentation_urls: api_endpoints_to_documentation_urls,
          webhook_setup_guide_url: webhook_setup_guide_url,
          category_beta_status: category_beta_status,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountIntegration to a JSON object
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
        obj.abbreviated_name&.is_a?(String) != false || raise("Passed value for field obj.abbreviated_name is not the expected type, validation failed.")
        obj.categories&.is_a?(Array) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.image&.is_a?(String) != false || raise("Passed value for field obj.image is not the expected type, validation failed.")
        obj.square_image&.is_a?(String) != false || raise("Passed value for field obj.square_image is not the expected type, validation failed.")
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.api_endpoints_to_documentation_urls&.is_a?(Hash) != false || raise("Passed value for field obj.api_endpoints_to_documentation_urls is not the expected type, validation failed.")
        obj.webhook_setup_guide_url&.is_a?(String) != false || raise("Passed value for field obj.webhook_setup_guide_url is not the expected type, validation failed.")
        obj.category_beta_status&.is_a?(Hash) != false || raise("Passed value for field obj.category_beta_status is not the expected type, validation failed.")
      end
    end
  end
end
