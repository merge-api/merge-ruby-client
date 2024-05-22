# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/categories_enum"
require_relative "../types/common_model_scopes_body_request"
require_relative "../types/link_token"
require "async"

module Merge
  module Filestorage
    class LinkTokenClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::LinkTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address. This is purely for identification purposes -
      #  setting this value will not cause any emails to be sent.
      # @param end_user_organization_name [String] Your end user's organization.
      # @param end_user_origin_id [String] This unique identifier typically represents the ID for your end user in your
      #  product's database. This value must be distinct from other Linked Accounts'
      #  unique identifiers.
      # @param categories [Array<Merge::Filestorage::CategoriesEnum>] The integration categories to show in Merge Link.
      # @param integration [String] The slug of a specific pre-selected integration for this linking flow token. For
      #  examples of slugs, see
      #  https://docs.merge.dev/guides/merge-link/single-integration/.
      # @param link_expiry_mins [Integer] An integer number of minutes between [30, 720 or 10080 if for a Magic Link URL]
      #  for how long this token is valid. Defaults to 30.
      # @param should_create_magic_link_url [Boolean] Whether to generate a Magic Link URL. Defaults to false. For more information on
      #  Magic Link, see
      #  https://merge.dev/blog/integrations-fast-say-hello-to-magic-link.
      # @param common_models [Array<Hash>] An array of objects to specify the models and fields that will be disabled for a
      #  given Linked Account. Each object uses model_id, enabled_actions, and
      #  disabled_fields to specify the model, method, and fields that are scoped for a
      #  given Linked Account.Request of type Array<Merge::Filestorage::CommonModelScopesBodyRequest>, as a Hash
      #   * :model_id (String)
      #   * :enabled_actions (Array<Merge::Filestorage::EnabledActionsEnum>)
      #   * :disabled_fields (Array<String>)
      # @param category_common_model_scopes [Hash{String => Array}] When creating a Link Token, you can set permissions for Common Models that will
      #  apply to the account that is going to be linked. Any model or field not
      #  specified in link token payload will default to existing settings.
      # @param language [String] The language code for the language to localize Merge Link to.
      # @param integration_specific_config [Hash{String => Object}] A JSON object containing integration-specific configuration options.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::LinkToken]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.create(
      #    end_user_email_address: "example@gmail.com",
      #    end_user_organization_name: "Test Organization",
      #    end_user_origin_id: "12345",
      #    categories: [HRIS]
      #  )
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, common_models: nil, category_common_model_scopes: nil, language: nil, integration_specific_config: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            end_user_email_address: end_user_email_address,
            end_user_organization_name: end_user_organization_name,
            end_user_origin_id: end_user_origin_id,
            categories: categories,
            integration: integration,
            link_expiry_mins: link_expiry_mins,
            should_create_magic_link_url: should_create_magic_link_url,
            common_models: common_models,
            category_common_model_scopes: category_common_model_scopes,
            language: language,
            integration_specific_config: integration_specific_config
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/link-token"
        end
        Merge::Filestorage::LinkToken.from_json(json_object: response.body)
      end
    end

    class AsyncLinkTokenClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncLinkTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address. This is purely for identification purposes -
      #  setting this value will not cause any emails to be sent.
      # @param end_user_organization_name [String] Your end user's organization.
      # @param end_user_origin_id [String] This unique identifier typically represents the ID for your end user in your
      #  product's database. This value must be distinct from other Linked Accounts'
      #  unique identifiers.
      # @param categories [Array<Merge::Filestorage::CategoriesEnum>] The integration categories to show in Merge Link.
      # @param integration [String] The slug of a specific pre-selected integration for this linking flow token. For
      #  examples of slugs, see
      #  https://docs.merge.dev/guides/merge-link/single-integration/.
      # @param link_expiry_mins [Integer] An integer number of minutes between [30, 720 or 10080 if for a Magic Link URL]
      #  for how long this token is valid. Defaults to 30.
      # @param should_create_magic_link_url [Boolean] Whether to generate a Magic Link URL. Defaults to false. For more information on
      #  Magic Link, see
      #  https://merge.dev/blog/integrations-fast-say-hello-to-magic-link.
      # @param common_models [Array<Hash>] An array of objects to specify the models and fields that will be disabled for a
      #  given Linked Account. Each object uses model_id, enabled_actions, and
      #  disabled_fields to specify the model, method, and fields that are scoped for a
      #  given Linked Account.Request of type Array<Merge::Filestorage::CommonModelScopesBodyRequest>, as a Hash
      #   * :model_id (String)
      #   * :enabled_actions (Array<Merge::Filestorage::EnabledActionsEnum>)
      #   * :disabled_fields (Array<String>)
      # @param category_common_model_scopes [Hash{String => Array}] When creating a Link Token, you can set permissions for Common Models that will
      #  apply to the account that is going to be linked. Any model or field not
      #  specified in link token payload will default to existing settings.
      # @param language [String] The language code for the language to localize Merge Link to.
      # @param integration_specific_config [Hash{String => Object}] A JSON object containing integration-specific configuration options.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::LinkToken]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.create(
      #    end_user_email_address: "example@gmail.com",
      #    end_user_organization_name: "Test Organization",
      #    end_user_origin_id: "12345",
      #    categories: [HRIS]
      #  )
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, common_models: nil, category_common_model_scopes: nil, language: nil, integration_specific_config: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              end_user_email_address: end_user_email_address,
              end_user_organization_name: end_user_organization_name,
              end_user_origin_id: end_user_origin_id,
              categories: categories,
              integration: integration,
              link_expiry_mins: link_expiry_mins,
              should_create_magic_link_url: should_create_magic_link_url,
              common_models: common_models,
              category_common_model_scopes: category_common_model_scopes,
              language: language,
              integration_specific_config: integration_specific_config
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/link-token"
          end
          Merge::Filestorage::LinkToken.from_json(json_object: response.body)
        end
      end
    end
  end
end
