require 'test_helper'

describe SimpleFormLocalizedInput::FormBuilder do
  let(:form) {
    simple_form_for(@user, url: '', html: { class: "foo" }) do |form|
      form.localized_input :title
    end
  }

  it { form.must_include "<div class=\"input string optional user_title_translations_en\"><label class=\"string optional\" for=\"user_title_translations_en\">Title (en)</label><input class=\"string optional\" type=\"text\" name=\"user[title_translations][en]\" id=\"user_title_translations_en\" /></div>" }

  it { form.must_include "<div class=\"input string optional user_title_translations_cs\"><label class=\"string optional\" for=\"user_title_translations_cs\">Title (cs)</label><input class=\"string optional\" type=\"text\" name=\"user[title_translations][cs]\" id=\"user_title_translations_cs\" /></div>" }
end
