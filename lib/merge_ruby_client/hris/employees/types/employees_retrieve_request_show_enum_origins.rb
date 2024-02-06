# frozen_string_literal: true

module Merge
  module Hris
    class Employees
      # @type [EMPLOYEES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS]
      EMPLOYEES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS = {
        employment_status: "employment_status",
        employment_status_ethnicity: "employment_status,ethnicity",
        employment_status_ethnicity_gender: "employment_status,ethnicity,gender",
        employment_status_ethnicity_gender_marital_status: "employment_status,ethnicity,gender,marital_status",
        employment_status_ethnicity_marital_status: "employment_status,ethnicity,marital_status",
        employment_status_gender: "employment_status,gender",
        employment_status_gender_marital_status: "employment_status,gender,marital_status",
        employment_status_marital_status: "employment_status,marital_status",
        ethnicity: "ethnicity",
        ethnicity_gender: "ethnicity,gender",
        ethnicity_gender_marital_status: "ethnicity,gender,marital_status",
        ethnicity_marital_status: "ethnicity,marital_status",
        gender: "gender",
        gender_marital_status: "gender,marital_status",
        marital_status: "marital_status"
      }.freeze
    end
  end
end
