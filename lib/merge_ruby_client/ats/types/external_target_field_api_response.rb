# frozen_string_literal: true

require_relative "external_target_field_api"
require "ostruct"
require "json"

module Merge
  module Ats
    class ExternalTargetFieldApiResponse
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :activity
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :application
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :attachment
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :candidate
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :department
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :eeoc
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :scheduled_interview
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :job
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :job_posting
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :job_interview_stage
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :offer
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :office
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :reject_reason
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :scorecard
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :tag
      # @return [Array<Merge::Ats::ExternalTargetFieldApi>]
      attr_reader :remote_user
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param activity [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param application [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param attachment [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param candidate [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param department [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param eeoc [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param scheduled_interview [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param job [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param job_posting [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param job_interview_stage [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param offer [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param office [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param reject_reason [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param scorecard [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param tag [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param remote_user [Array<Merge::Ats::ExternalTargetFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ExternalTargetFieldApiResponse]
      def initialize(activity: OMIT, application: OMIT, attachment: OMIT, candidate: OMIT, department: OMIT,
                     eeoc: OMIT, scheduled_interview: OMIT, job: OMIT, job_posting: OMIT, job_interview_stage: OMIT, offer: OMIT, office: OMIT, reject_reason: OMIT, scorecard: OMIT, tag: OMIT, remote_user: OMIT, additional_properties: nil)
        @activity = activity if activity != OMIT
        @application = application if application != OMIT
        @attachment = attachment if attachment != OMIT
        @candidate = candidate if candidate != OMIT
        @department = department if department != OMIT
        @eeoc = eeoc if eeoc != OMIT
        @scheduled_interview = scheduled_interview if scheduled_interview != OMIT
        @job = job if job != OMIT
        @job_posting = job_posting if job_posting != OMIT
        @job_interview_stage = job_interview_stage if job_interview_stage != OMIT
        @offer = offer if offer != OMIT
        @office = office if office != OMIT
        @reject_reason = reject_reason if reject_reason != OMIT
        @scorecard = scorecard if scorecard != OMIT
        @tag = tag if tag != OMIT
        @remote_user = remote_user if remote_user != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "Activity": activity,
          "Application": application,
          "Attachment": attachment,
          "Candidate": candidate,
          "Department": department,
          "EEOC": eeoc,
          "ScheduledInterview": scheduled_interview,
          "Job": job,
          "JobPosting": job_posting,
          "JobInterviewStage": job_interview_stage,
          "Offer": offer,
          "Office": office,
          "RejectReason": reject_reason,
          "Scorecard": scorecard,
          "Tag": tag,
          "RemoteUser": remote_user
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExternalTargetFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Ats::ExternalTargetFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        activity = parsed_json["Activity"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        application = parsed_json["Application"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        attachment = parsed_json["Attachment"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        candidate = parsed_json["Candidate"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        department = parsed_json["Department"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        eeoc = parsed_json["EEOC"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        scheduled_interview = parsed_json["ScheduledInterview"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        job = parsed_json["Job"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        job_posting = parsed_json["JobPosting"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        job_interview_stage = parsed_json["JobInterviewStage"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        offer = parsed_json["Offer"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        office = parsed_json["Office"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        reject_reason = parsed_json["RejectReason"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        scorecard = parsed_json["Scorecard"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        tag = parsed_json["Tag"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        remote_user = parsed_json["RemoteUser"]&.map do |v|
          v = v.to_json
          Merge::Ats::ExternalTargetFieldApi.from_json(json_object: v)
        end
        new(
          activity: activity,
          application: application,
          attachment: attachment,
          candidate: candidate,
          department: department,
          eeoc: eeoc,
          scheduled_interview: scheduled_interview,
          job: job,
          job_posting: job_posting,
          job_interview_stage: job_interview_stage,
          offer: offer,
          office: office,
          reject_reason: reject_reason,
          scorecard: scorecard,
          tag: tag,
          remote_user: remote_user,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExternalTargetFieldApiResponse to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.activity&.is_a?(Array) != false || raise("Passed value for field obj.activity is not the expected type, validation failed.")
        obj.application&.is_a?(Array) != false || raise("Passed value for field obj.application is not the expected type, validation failed.")
        obj.attachment&.is_a?(Array) != false || raise("Passed value for field obj.attachment is not the expected type, validation failed.")
        obj.candidate&.is_a?(Array) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.department&.is_a?(Array) != false || raise("Passed value for field obj.department is not the expected type, validation failed.")
        obj.eeoc&.is_a?(Array) != false || raise("Passed value for field obj.eeoc is not the expected type, validation failed.")
        obj.scheduled_interview&.is_a?(Array) != false || raise("Passed value for field obj.scheduled_interview is not the expected type, validation failed.")
        obj.job&.is_a?(Array) != false || raise("Passed value for field obj.job is not the expected type, validation failed.")
        obj.job_posting&.is_a?(Array) != false || raise("Passed value for field obj.job_posting is not the expected type, validation failed.")
        obj.job_interview_stage&.is_a?(Array) != false || raise("Passed value for field obj.job_interview_stage is not the expected type, validation failed.")
        obj.offer&.is_a?(Array) != false || raise("Passed value for field obj.offer is not the expected type, validation failed.")
        obj.office&.is_a?(Array) != false || raise("Passed value for field obj.office is not the expected type, validation failed.")
        obj.reject_reason&.is_a?(Array) != false || raise("Passed value for field obj.reject_reason is not the expected type, validation failed.")
        obj.scorecard&.is_a?(Array) != false || raise("Passed value for field obj.scorecard is not the expected type, validation failed.")
        obj.tag&.is_a?(Array) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
        obj.remote_user&.is_a?(Array) != false || raise("Passed value for field obj.remote_user is not the expected type, validation failed.")
      end
    end
  end
end
