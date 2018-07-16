require 'simple_form'

module SimpleFormLocalizedInput
  module FormBuilder
    include SimpleForm::Helpers::Validators

    def self.included(base)
      base.class_eval do
        def localized_input(attribute_name, options = {})
          field_name = [attribute_name, 'translations'].join('_')
          field_value = OpenStruct.new(object.send(field_name))

          simple_fields_for(field_name, field_value) do |fields|
            ::I18n.available_locales.collect do |loc|
              collection = options[:collection_translations] ? options[:collection_translations][loc.to_s] : options[:collection]

              column = find_attribute_column(attribute_name)
              input_type = default_input_type(attribute_name, column, options)

              localized_label = SimpleForm::Inputs::Base.new(
                self,
                attribute_name,
                column,
                input_type,
                options
              ).send(:raw_label_text)

              required = object.class.validators_on(attribute_name).any? do |v|
                v.kind == :presence &&
                  valid_validator?(v) &&
                  valid_localized_presence_validator?(v, loc)
              end

              fields.input(
                loc.to_sym,
                options.merge(collection: collection, label: "#{localized_label} (#{loc})".html_safe, required: required)
              )
            end.join.html_safe
          end + hint(attribute_name) + error(attribute_name)
        end

        private

        def valid_localized_presence_validator?(validator, locale)
          in_option = validator.options.fetch(:in, nil)
          with_option = validator.options.fetch(:with, nil)
          return true unless in_option.present? || with_option.present?

          with_option = ::I18n.default_locale if with_option == :default_locale
          Array(in_option || with_option).map(&:to_s).include?(locale.to_s)
        end
      end
    end
  end
end

SimpleForm::FormBuilder.send(:include, SimpleFormLocalizedInput::FormBuilder)
