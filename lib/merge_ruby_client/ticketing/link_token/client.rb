# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/categories_enum"
require_relative "../types/common_model_scopes_body_request"
require_relative "../types/link_token"
require "async"

module Merge
  module Ticketing
    class LinkTokenClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ticketing::LinkTokenClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address. This is purely for identification purposes - setting this value will not cause any emails to be sent.
      # @param end_user_organization_name [String] Your end user's organization.
      # @param end_user_origin_id [String] This unique identifier typically represents the ID for your end user in your product's database. This value must be distinct from other Linked Accounts' unique identifiers.
      # @param categories [Array<Ticketing::CATEGORIES_ENUM>] The integration categories to show in Merge Link.
      # @param integration [String] The slug of a specific pre-selected integration for this linking flow token. For examples of slugs, see https://docs.merge.dev/guides/merge-link/single-integration/.
      # @param link_expiry_mins [Integer] An integer number of minutes between [30, 720 or 10080 if for a Magic Link URL] for how long this token is valid. Defaults to 30.
      # @param should_create_magic_link_url [Boolean] Whether to generate a Magic Link URL. Defaults to false. For more information on Magic Link, see https://merge.dev/blog/integrations-fast-say-hello-to-magic-link.
      # @param common_models [Array<Hash>] An array of objects to specify the models and fields that will be disabled for a given Linked Account. Each object uses model_id, enabled_actions, and disabled_fields to specify the model, method, and fields that are scoped for a given Linked Account.Request of type Array<Ticketing::CommonModelScopesBodyRequest>, as a Hash
      #   * :model_id (String)
      #   * :enabled_actions (Array<Ticketing::ENABLED_ACTIONS_ENUM>)
      #   * :disabled_fields (Array<String>)
      # @param request_options [RequestOptions]
      # @return [Ticketing::LinkToken]
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, common_models: nil, request_options: nil)
        response = @request_client.conn.post("/api/ticketing/v1/link-token") do |req|
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
            common_models: common_models
          }.compact
        end
        Ticketing::LinkToken.from_json(json_object: response.body)
      end
    end

    class AsyncLinkTokenClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ticketing::AsyncLinkTokenClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Creates a link token to be used when linking a new end user.
      #
      # @param end_user_email_address [String] Your end user's email address. This is purely for identification purposes - setting this value will not cause any emails to be sent.
      # @param end_user_organization_name [String] Your end user's organization.
      # @param end_user_origin_id [String] This unique identifier typically represents the ID for your end user in your product's database. This value must be distinct from other Linked Accounts' unique identifiers.
      # @param categories [Array<Ticketing::CATEGORIES_ENUM>] The integration categories to show in Merge Link.
      # @param integration [String] The slug of a specific pre-selected integration for this linking flow token. For examples of slugs, see https://docs.merge.dev/guides/merge-link/single-integration/.
      # @param link_expiry_mins [Integer] An integer number of minutes between [30, 720 or 10080 if for a Magic Link URL] for how long this token is valid. Defaults to 30.
      # @param should_create_magic_link_url [Boolean] Whether to generate a Magic Link URL. Defaults to false. For more information on Magic Link, see https://merge.dev/blog/integrations-fast-say-hello-to-magic-link.
      # @param common_models [Array<Hash>] An array of objects to specify the models and fields that will be disabled for a given Linked Account. Each object uses model_id, enabled_actions, and disabled_fields to specify the model, method, and fields that are scoped for a given Linked Account.Request of type Array<Ticketing::CommonModelScopesBodyRequest>, as a Hash
      #   * :model_id (String)
      #   * :enabled_actions (Array<Ticketing::ENABLED_ACTIONS_ENUM>)
      #   * :disabled_fields (Array<String>)
      # @param request_options [RequestOptions]
      # @return [Ticketing::LinkToken]
      def create(end_user_email_address:, end_user_organization_name:, end_user_origin_id:, categories:,
                 integration: nil, link_expiry_mins: nil, should_create_magic_link_url: nil, common_models: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ticketing/v1/link-token") do |req|
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
              common_models: common_models
            }.compact
          end
          Ticketing::LinkToken.from_json(json_object: response.body)
        end
      end
    end
  end
end
