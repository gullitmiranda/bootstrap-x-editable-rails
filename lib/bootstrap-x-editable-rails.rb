require "rails"
require "bootstrap-x-editable-rails/version"
require "bootstrap-x-editable-rails/helpers/x_editable_helper"

module BootstrapXEditableRails
  module Rails
    if ::Rails.version < "3.1"
      require "bootstrap-x-editable-rails/railtie"
    else
      require "bootstrap-x-editable-rails/engine"
    end
  end
end