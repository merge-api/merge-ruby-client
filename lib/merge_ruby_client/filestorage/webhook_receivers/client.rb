# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/webhook_receiver"
require "json"
require "async"

module Merge
  module Filestorage
    class WebhookReceiversClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::WebhookReceiversClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `WebhookReceiver` objects.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Filestorage::WebhookReceiver>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.list
      def list(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/webhook-receivers"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |v|
          v = v.to_json
          Merge::Filestorage::WebhookReceiver.from_json(json_object: v)
        end
      end

      # Creates a `WebhookReceiver` object with the given values.
      #
      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::WebhookReceiver]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.create(event: "event", is_active: true)
      def create(event:, is_active:, key: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            event: event,
            is_active: is_active,
            key: key
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/webhook-receivers"
        end
        Merge::Filestorage::WebhookReceiver.from_json(json_object: response.body)
      end
    end

    class AsyncWebhookReceiversClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncWebhookReceiversClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `WebhookReceiver` objects.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Filestorage::WebhookReceiver>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.list
      def list(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/webhook-receivers"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |v|
            v = v.to_json
            Merge::Filestorage::WebhookReceiver.from_json(json_object: v)
          end
        end
      end

      # Creates a `WebhookReceiver` object with the given values.
      #
      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::WebhookReceiver]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.create(event: "event", is_active: true)
      def create(event:, is_active:, key: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              event: event,
              is_active: is_active,
              key: key
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/webhook-receivers"
          end
          Merge::Filestorage::WebhookReceiver.from_json(json_object: response.body)
        end
      end
    end
  end
end
