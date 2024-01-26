# frozen_string_literal: true

module Merge
  module Ats
    module Eeocs
      # @type [Hash{String => String}]
      EEOCS_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        disability_status: "disability_status",
        disability_status_gender: "disability_status,gender",
        disability_status_gender_race: "disability_status,gender,race",
        disability_status_gender_race_veteran_status: "disability_status,gender,race,veteran_status",
        disability_status_gender_veteran_status: "disability_status,gender,veteran_status",
        disability_status_race: "disability_status,race",
        disability_status_race_veteran_status: "disability_status,race,veteran_status",
        disability_status_veteran_status: "disability_status,veteran_status",
        gender: "gender",
        gender_race: "gender,race",
        gender_race_veteran_status: "gender,race,veteran_status",
        gender_veteran_status: "gender,veteran_status",
        race: "race",
        race_veteran_status: "race,veteran_status",
        veteran_status: "veteran_status"
      }.frozen
    end
  end
end
