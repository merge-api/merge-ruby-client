# frozen_string_literal: true

require_relative "../../requests"
require_relative "integration_metadata/client"

module Merge
  module Basics
    class Client
      # @return [Merge::Basics::IntegrationMetadataClient]
      attr_reader :integration_metadata

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Basics::Client]
      def initialize(request_client:)
        @integration_metadata = Merge::Basics::IntegrationMetadataClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Basics::IntegrationMetadataClient]
      attr_reader :integration_metadata

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Basics::AsyncClient]
      def initialize(request_client:)
        @integration_metadata = Basics::AsyncIntegrationMetadataClient.new(request_client: request_client)
      end
    end
  end
end
