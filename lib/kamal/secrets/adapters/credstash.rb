class Kamal::Secrets::Adapters::Credstash < Kamal::Secrets::Adapters::Base
  def requires_account?
    false
  end

  private
    def login(*)
     true
    end

    # since kamal sends the bucket name in the from: option, we need to split it back out
    # credstash get wested-project-environment returns a json object of ENV key/values
    def fetch_secrets(secrets, **)
      {}.tap do |results|
        secrets.each do |fullsecret|
          bucket, secret = fullsecret.split("/")

          json = `credstash get #{bucket.shellescape}`
          raise RuntimeError, "Could not read #{secret} from credstash" unless $?.success?
          JSON.parse(json).each do |key, value|
            results[key] = value
          end
        end
      end
    end



    def check_dependencies!
      raise RuntimeError, "Credstash CLI is not installed" unless cli_installed?
    end

    def cli_installed?
      `credstash -h 2> /dev/null`
      $?.success?
    end
end
