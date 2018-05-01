# Simple Form Localized Input

[![Build Status](https://travis-ci.org/tomasc/simple_form_localized_input.svg)](https://travis-ci.org/tomasc/simple_form_localized_input) [![Gem Version](https://badge.fury.io/rb/simple_form_localized_input.svg)](http://badge.fury.io/rb/simple_form_localized_input) [![Coverage Status](https://img.shields.io/coveralls/tomasc/simple_form_localized_input.svg)](https://coveralls.io/r/tomasc/simple_form_localized_input)

[Simple Form](https://github.com/plataformatec/simple_form) custom input which renders a field for multiple locales in one form. Designed to be used with [Mongoid](https://github.com/mongoid/mongoid).

## Installation

Add this line to your application's Gemfile:

    gem 'simple_form_localized_input'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_form_localized_input

## Usage

In your model:

```Ruby
class MyModel
  include Mongoid::Document
  field :title, type: String, localize: true
end
```

In your simple form:

```Ruby
= form.localized_input :title
```

This works with inputs of various types, and you can pass options to an input as usual.

## Contributing

1. Fork it ( https://github.com/tomasc/simple_form_localized_input/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
