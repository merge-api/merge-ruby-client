# frozen_string_literal: true

module TestSupport
  module Integration
    MAX_ITEMS = 5

    API_KEY_VAR = "SDK_TESTING_KEY_SECONDARY"

    ACCOUNT_TOKEN_VARS = {
      "accounting" => "SDK_TESTING_ACCOUNTING_ACCOUNT_TOKEN",
      "ats" => "SDK_TESTING_ATS_ACCOUNT_TOKEN",
      "crm" => "SDK_TESTING_CRM_ACCOUNT_TOKEN",
      "filestorage" => "SDK_TESTING_FILE_STORAGE_ACCOUNT_TOKEN",
      "hris" => "SDK_TESTING_HRIS_ACCOUNT_TOKEN",
      "ticketing" => "SDK_TESTING_TICKETING_ACCOUNT_TOKEN"
    }.freeze

    def env_value(name)
      value = ENV[name]
      value.nil? || value.empty? ? nil : value
    end

    def integration_client(category)
      token_var = ACCOUNT_TOKEN_VARS.fetch(category)
      api_key = env_value(API_KEY_VAR)
      account_token = env_value(token_var)

      skip("set #{API_KEY_VAR} and #{token_var} to run #{category} integration tests") if api_key.nil? || account_token.nil?

      Merge::Client.new(api_key: api_key, account_token: account_token)
    end

    def smoke_list(page)
      refute_nil page
      refute_nil page.results
      assert_kind_of Array, page.results
      page
    end

    def smoke_list_and_retrieve(page)
      smoke_list(page)
      first = page.results.first

      skip("no records available on this linked account") if first.nil?

      retrieved = yield(first.id)

      refute_nil retrieved
      assert_equal first.id, retrieved.id
    end
  end
end
