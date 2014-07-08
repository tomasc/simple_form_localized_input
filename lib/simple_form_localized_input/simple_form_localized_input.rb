class SimpleFormLocalizedInput < SimpleForm::FormBuilder

  # ---------------------------------------------------------------------

  def localized_input attribute_name, options={}
    simple_fields_for "#{attribute_name}_translations", OpenStruct.new(object.send("#{attribute_name}_translations")) do |f|
      I18n.available_locales.collect do |loc|
        f.input loc.to_sym, options.merge(
          {
            collection: (options[:collection_translations] ? options[:collection_translations][loc.to_s] : options[:collection]),
            label: [object.class.human_attribute_name(attribute_name), "(#{loc})"].reject(&:blank?).join(' ')
          }
        )
      end.join.html_safe
    end
  end

  # ---------------------------------------------------------------------

end