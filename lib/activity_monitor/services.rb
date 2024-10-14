# frozen_string_literal: true

module ActivityMonitor
  module Services

    def self.get_service(service_name)
      case service_name
      when :bitbucket
        Services::Bitbucket.new
      when :codeberg
        Services::Codeberg.new
      when :github
        Services::Github.new
      when :gitlab
        Services::Gitlab.new
      else
        raise Errors::ServiceError.new("'#{service_name}' not found. It probably needs to be implemented.")
      end
    end
  end
end
