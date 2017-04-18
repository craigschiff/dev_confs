# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

ActiveModelSerializers.config.adapter = :json_api

run Rails.application
