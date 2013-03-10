module BootstrapXEditableRails
  module Rails
    class Engine < ::Rails::Engine
      initializer "bootstrap-x-editable-rails.helpers.x_editable_helper" do
        ActionView::Base.send :include, XEditableHelper
      end
    end
  end
end