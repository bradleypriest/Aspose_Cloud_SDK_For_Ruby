# This class allows you to set the AppSID and AppKey values you get upon signing up
module Aspose
  module Cloud
    module Common
      class AsposeApp

        def self.app_sid
          @@app_sid
        end

        def self.app_sid= app_sid
          @@app_sid = app_sid
        end

        def self.app_key
          @@app_key
        end

        def self.app_key= app_key
          @@app_key = app_key
        end

        def self.output_location
          @@output_location
        end

        def self.output_location= output_location
          @@output_location = output_location
        end

      end
    end
  end
end