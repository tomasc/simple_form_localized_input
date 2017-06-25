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
              label = [object.class.human_attribute_name(attribute_name), "(#{loc})"].reject(&:blank?).join(' ')
              required = object.class.validators_on(attribute_name).any? { |v| v.kind == :presence && valid_validator?(v) }

              fields.input(loc.to_sym, options.merge(collection: collection, label: label, required: required))
            end.join.html_safe
          end +
          error(attribute_name)
        end
      end
    end
  end
end

SimpleForm::FormBuilder.send :include, SimpleFormLocalizedInput::FormBuilder
