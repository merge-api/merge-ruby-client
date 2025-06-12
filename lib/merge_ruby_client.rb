# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "merge_ruby_client/ats/client"
require_relative "merge_ruby_client/crm/client"
require_relative "merge_ruby_client/filestorage/client"
require_relative "merge_ruby_client/hris/client"
require_relative "merge_ruby_client/ticketing/client"
require_relative "merge_ruby_client/accounting/client"

module Merge
  class Client
    # @return [Merge::Ats::Client]
    attr_reader :ats
    # @return [Merge::Crm::Client]
    attr_reader :crm
    # @return [Merge::Filestorage::Client]
    attr_reader :filestorage
    # @return [Merge::Hris::Client]
    attr_reader :hris
    # @return [Merge::Ticketing::Client]
    attr_reader :ticketing
    # @return [Merge::Accounting::Client]
    attr_reader :accounting

    # @param base_url [String]
    # @param environment [Merge::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [Merge::Client]
    def initialize(api_key:, base_url: nil, environment: Merge::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, account_token: nil)
      @request_client = Merge::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key,
        account_token: account_token
      )
      @ats = Merge::Ats::Client.new(request_client: @request_client)
      @crm = Merge::Crm::Client.new(request_client: @request_client)
      @filestorage = Merge::Filestorage::Client.new(request_client: @request_client)
      @hris = Merge::Hris::Client.new(request_client: @request_client)
      @ticketing = Merge::Ticketing::Client.new(request_client: @request_client)
      @accounting = Merge::Accounting::Client.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [Merge::Ats::AsyncClient]
    attr_reader :ats
    # @return [Merge::Crm::AsyncClient]
    attr_reader :crm
    # @return [Merge::Filestorage::AsyncClient]
    attr_reader :filestorage
    # @return [Merge::Hris::AsyncClient]
    attr_reader :hris
    # @return [Merge::Ticketing::AsyncClient]
    attr_reader :ticketing
    # @return [Merge::Accounting::AsyncClient]
    attr_reader :accounting

    # @param base_url [String]
    # @param environment [Merge::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [Merge::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: Merge::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, account_token: nil)
      @async_request_client = Merge::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key,
        account_token: account_token
      )
      @ats = Merge::Ats::AsyncClient.new(request_client: @async_request_client)
      @crm = Merge::Crm::AsyncClient.new(request_client: @async_request_client)
      @filestorage = Merge::Filestorage::AsyncClient.new(request_client: @async_request_client)
      @hris = Merge::Hris::AsyncClient.new(request_client: @async_request_client)
      @ticketing = Merge::Ticketing::AsyncClient.new(request_client: @async_request_client)
      @accounting = Merge::Accounting::AsyncClient.new(request_client: @async_request_client)
    end
  end
end
