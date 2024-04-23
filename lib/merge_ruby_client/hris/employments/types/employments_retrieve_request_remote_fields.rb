# frozen_string_literal: true

module Merge
  module Hris
    class Employments
      class EmploymentsRetrieveRequestRemoteFields
        EMPLOYMENT_TYPE = "employment_type"
        EMPLOYMENT_TYPE_FLSA_STATUS = "employment_type,flsa_status"
        EMPLOYMENT_TYPE_FLSA_STATUS_PAY_FREQUENCY = "employment_type,flsa_status,pay_frequency"
        EMPLOYMENT_TYPE_FLSA_STATUS_PAY_FREQUENCY_PAY_PERIOD = "employment_type,flsa_status,pay_frequency,pay_period"
        EMPLOYMENT_TYPE_FLSA_STATUS_PAY_PERIOD = "employment_type,flsa_status,pay_period"
        EMPLOYMENT_TYPE_PAY_FREQUENCY = "employment_type,pay_frequency"
        EMPLOYMENT_TYPE_PAY_FREQUENCY_PAY_PERIOD = "employment_type,pay_frequency,pay_period"
        EMPLOYMENT_TYPE_PAY_PERIOD = "employment_type,pay_period"
        FLSA_STATUS = "flsa_status"
        FLSA_STATUS_PAY_FREQUENCY = "flsa_status,pay_frequency"
        FLSA_STATUS_PAY_FREQUENCY_PAY_PERIOD = "flsa_status,pay_frequency,pay_period"
        FLSA_STATUS_PAY_PERIOD = "flsa_status,pay_period"
        PAY_FREQUENCY = "pay_frequency"
        PAY_FREQUENCY_PAY_PERIOD = "pay_frequency,pay_period"
        PAY_PERIOD = "pay_period"
      end
    end
  end
end
