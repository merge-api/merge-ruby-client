# frozen_string_literal: true

module Merge
  module Hris
    class Employments
      # @type [EMPLOYMENTS_LIST_REQUEST_REMOTE_FIELDS]
      EMPLOYMENTS_LIST_REQUEST_REMOTE_FIELDS = {
        employment_type: "employment_type",
        employment_type_flsa_status: "employment_type,flsa_status",
        employment_type_flsa_status_pay_frequency: "employment_type,flsa_status,pay_frequency",
        employment_type_flsa_status_pay_frequency_pay_period: "employment_type,flsa_status,pay_frequency,pay_period",
        employment_type_flsa_status_pay_period: "employment_type,flsa_status,pay_period",
        employment_type_pay_frequency: "employment_type,pay_frequency",
        employment_type_pay_frequency_pay_period: "employment_type,pay_frequency,pay_period",
        employment_type_pay_period: "employment_type,pay_period",
        flsa_status: "flsa_status",
        flsa_status_pay_frequency: "flsa_status,pay_frequency",
        flsa_status_pay_frequency_pay_period: "flsa_status,pay_frequency,pay_period",
        flsa_status_pay_period: "flsa_status,pay_period",
        pay_frequency: "pay_frequency",
        pay_frequency_pay_period: "pay_frequency,pay_period",
        pay_period: "pay_period"
      }.freeze
    end
  end
end
