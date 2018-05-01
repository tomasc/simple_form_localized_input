$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mongoid"
require "simple_form_localized_input"

require "bundler/setup"
require "minitest"
require "minitest/autorun"
require "minitest/spec"

require "action_view"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

::I18n.available_locales = %i(en cs)

class MiniTest::Spec
  include ActionView::Helpers::FormHelper
  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper

  before { set_controller }
  before { setup_users }

  attr_accessor :output_buffer
  attr_accessor :controller

  def set_controller
    @controller = MockController.new
  end

  def setup_users(extra_attributes = {})
    @user = User.new(extra_attributes)
  end

  def protect_against_forgery?
    false
  end

  def user_path(*args)
    '/users'
  end

  alias :users_path :user_path
end
