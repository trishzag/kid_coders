# kid_coders

![Kid Coders Logo](kidcoders.png)

# Introduction

Kid Coders is a learn-to-code website hosted at https://.  The application was designed and built as a "breakable toy" team during the Fall 2015 cohort at Launch Academy (http://www.launchacademy.com/).

![Build Status](https://codeship.com/projects/278d46e0-4d07-0133-9ee6-6e1cce453881/status?branch=master)
![Coverage Status](https://coveralls.io/repos/trishzag/kid_coders/badge.png)
![Code Climate](https://codeclimate.com/github/trishzag/kid_coders/badges/gpa.svg)
![Test Coverage](https://codeclimate.com/github/trishzag/kid_coders/badges/coverage.svg)

# Topics

- [Features](#features)
- [Challenges](#challenges)
- [Development](#development)
    - [Testing](#testing)
    - [Test Development](#test-development)
- [ER Diagram](#er-diagram)
- [License](#license)

# Features

- User login with either username or email.  Managed with Devise.

# Development

Kid Coders was developed in Ruby on Rails.  Initial setup was done using the make_it_so gem (https://github.com/LaunchAcademy/make_it_so).  

Also used during the application development

- Foundation (http://foundation.zurb.com/) was used for css styling.
- Devise (https://github.com/plataformatec/devise) was used for authentication.


## Testing

For development tasks such as running benchmarks or testing, you need to clone the repository and install bundle.  All required gems are listed in the Gemfile.

Install [bundle](http://bundler.io/).

    git clone git@github.com:trishzag/kid_coders.git
    cd kid_coders
    bundle install

## Test Development

The following gems were used to develop and run unit and feature tests:
- RAKE (http://rake.rubyforge.org/)
- RSpec (http://rspec.info/)
- selenium-webdriver (https://github.com/seleniumhq/selenium)
- Capybara (https://github.com/jnicklas/capybara)
- shoulda-matchers (http://matchers.shoulda.io/)
- valid_attributes (https://github.com/bcardarella/valid_attribute)

To prepare for testing, run:

    rake db:test:prepare

To run all test files, run:

    rake

You may specify an individual test file to run using rspec:

    rspec <full test name>

For example:

    rspec spec/features/user_views_user_detail_spec.rb

**Note** that some feature testing requires the use of Firefox, which must be located in the user's application directory.

# ER Diagram

![Entity Relationship Diagram](KidsWhoCodeERD.png)

# License

The MIT License (MIT)

Copyright (c) 2014 Petka Antonov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
