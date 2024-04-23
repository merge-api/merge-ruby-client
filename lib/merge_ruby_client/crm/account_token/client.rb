# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/account_token"
require "async"

module Merge
  module Crm
    class AccountTokenClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::AccountTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns the account token for the end user with the provided public token.
      #
      # @param public_token [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::AccountToken]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.retrieve(public_token: "public_token")
      def retrieve(public_token:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/account-token/#{public_token}"
        end
        Merge::Crm::AccountToken.from_json(json_object: response.body)
      end
    end

    class AsyncAccountTokenClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncAccountTokenClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns the account token for the end user with the provided public token.
      #
      # @param public_token [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::AccountToken]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.retrieve(public_token: "public_token")
      def retrieve(public_token:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/account-token/#{public_token}"
          end
          Merge::Crm::AccountToken.from_json(json_object: response.body)
        end
      end
    end
  end
end
