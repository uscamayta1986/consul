
[![Build Status](https://secure.travis-ci.org/email-spec/email-spec.png)](http://travis-ci.org/email-spec/email-spec)

## Email Spec

A collection of matchers for `RSpec`, `MiniTest` and `Cucumber` steps to make testing emails go smoothly.

This library works with `ActionMailer` and `Pony`.  When using it with ActionMailer it works with ActiveRecord Mailer, and [action_mailer_cache_delivery](https://rubygems.org/gems/action_mailer_cache_delivery).

If you are testing emails in conjunction with an automated browser solution, like Selenium,
you will want to use [action_mailer_cache_delivery](http://rubygems.org/gems/action_mailer_cache_delivery) in your test environment.  (This is
because your test process and server processes are distinct and therefore need an
intermediate store for the emails.) ActiveRecord Mailer will also work but
you generally don't want to include those projects unless you need them in production.

### Gem Setup

```ruby
# Gemfile
group :test do
  gem 'email_spec'
end
```

### Cucumber

To use the steps in features put the following in your env.rb:

```ruby
# Make sure this require is after you require cucumber/rails/world.
require 'email_spec' # add this line if you use spork
require 'email_spec/cucumber'
```

This will load all the helpers that the steps rely on. It will also add a `Before` hook for `Cucumber` so that emails are cleared at the start of each scenario.

Then:

```bash
rails generate email_spec:steps
```

This will give you a bunch of steps to get started with in `step_definitions/email_steps.rb`

By default, the generated file will look for email to example@example.com. You can either change this by editing the `current_email_address` method in `email_steps.rb`, or by simply specifying the target email in your features:

```gherkin
Scenario: A new person signs up
    Given I am at "/"
    When I fill in "Email" with "quentin@example.com"
    And I press "Sign up"
    Then "quentin@example.com" should receive an email   # Specify who should receive the email
```

### Spinach

To use the helpers and matchers in your Spinach steps, add this to your env.rb:

```ruby
require 'email_spec/spinach'
```

Creating shared steps (as for Cucumber above) doesn't fit so well with the Spinach ethos of very compartmentalized steps, so there is no generator for Spinach. It's easy to use the helpers/matchers in your steps. For example:

```ruby
step 'the last email sent should welcome the user' do
  expect(last_email_sent).to have_subject('Welcome')
end
```

### RSpec (3.1+)

First you need to require `email_spec` in your `spec_helper.rb`:

```ruby
require "email_spec"
require "email_spec/rspec"
```

This will load all the helpers that the scenarios can count on. It will also add a `before(:each)` hook so that emails are cleared at the start of each scenario.

If you are upgrading to Rails 5, make sure your `rails_helper.rb` requires `spec_helper` **after** loading the environment. For example:
```ruby
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
```

### MiniTest

First you need to require minitest-matchers and email_spec in your test_helper.rb:

```ruby
require "minitest-matchers"
require "email_spec"
```

You will then need to include EmailSpec::Helpers and EmailSpec::Matchers in your test classes.
If you want to have access to the helpers and matchers in all of your tests you can do the following in your test_helper.rb:

```ruby
class MiniTest::Unit::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers
end
```

Otherwise, you will need to include them in the tests where you use them:

```ruby
class SignupMailerTest < MiniTest::Unit::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  ...
end
```

Or, if you are using the MiniTest spec DSL, it would look like this:

```ruby
describe SignupMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  ...
end
```

### Turnip

If you're using [Turnip](https://github.com/jnicklas/turnip), you might be interested in this [conversion of the Cucumber steps into Turnip steps](https://github.com/jmuheim/base/blob/7708873e77165993c2c962894c756621be1b15cc/spec/steps/email_steps.rb).

## Background Jobs

If you are using a background job, you might need to use a step to process the jobs. Another alternative is to use an inline statement for your scenario.

For example, for DelayedJob:

```ruby
Delayed::Worker.delay_jobs = false
```

## Usage

### Cucumber

```gherkin
Scenario: A new person signs up
    Given I am at "/"
    When I fill in "Email" with "quentin@example.com"
    And I press "Sign up"
    And I should receive an email
    When I open the email
    Then I should see "confirm" in the email body
    When I follow "confirm" in the email
    Then I should see "Confirm your new account"
```

For more examples, check out examples/rails_root in the source for a small example app that implements these steps.

### Cucumber Matchers (Ruby)

See RSpec Matchers (they are the same)

### RSpec

#### Testing In Isolation
It is often useful to test your mailers in isolation.  You can accomplish this by using mocks to verify that the mailer is being called in the correct place and then write focused examples for the actual mailer.  This is a simple example from the sample app found in the gem:

Verify that the mailer is used correctly in the controller (this would apply to a model as well):

```ruby
describe "POST /signup (#signup)" do
  it "should deliver the signup email" do
    # expect
    expect(UserMailer).to(receive(:deliver_signup).with("email@example.com", "Jimmy Bean"))
    # when
    post :signup, "Email" => "email@example.com", "Name" => "Jimmy Bean"
  end
end
```

Examples for the #signup method in UserMailer:

```ruby
describe "Signup Email" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # include ActionController::UrlWriter - old rails
  include Rails.application.routes.url_helpers

  before(:all) do
    @email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
  end

  it "should be set to be delivered to the email passed in" do
    expect(@email).to deliver_to("jojo@yahoo.com")
  end

  it "should contain the user's message in the mail body" do
    expect(@email).to have_body_text(/Jojo Binks/)
  end

  it "should contain a link to the confirmation link" do
    expect(@email).to have_body_text(/#{confirm_account_url}/)
  end

  it "should have the correct subject" do
    expect(@email).to have_subject(/Account confirmation/)
  end

end
```

#### RSpec Matchers

##### reply_to(email)
alias: `have_reply_to`

This checks that the Reply-To header's email address (the bob@example.com of
"Bob Saget <bob@example.com>") is set to the given string.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to reply_to("support@myapp.com")
```


##### deliver_to(\*email_addresses)
alias: `be_delivered_to`

This checks that the To header's email addresses (the bob@example.com of
"Bob Saget <bob@example.com>") are set to the addresses.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to deliver_to("jojo@yahoo.com")
```


##### deliver_from(email)
alias: `be_delivered_from`

This checks that the From header's email address (the bob@example.com of
"Bob Saget <bob@example.com>") is set to the given string.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to deliver_from("sally@yahoo.com")
```


##### bcc_to(\*email_addresses)

This checks that the BCC header's email addresses (the bob@example.com of
"Bob Saget <bob@example.com>") are set to the addresses.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to bcc_to("sue@yahoo.com", "bill@yahoo.com")
```


##### cc_to(\*email_addresses)

This checks that the CC header's email addresses (the bob@example.com of
"Bob Saget <bob@example.com>") are set to the addresses.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to cc_to("sue@yahoo.com", "bill@yahoo.com")
```


##### have_subject(subject)

This checks that the Subject header's value is set to the given subject.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to have_subject("Welcome!")
```


##### include_email_with_subject(subject)
Note: subject can be either a String or a Regexp

This checks that one of the given emails' subjects includes the subject.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
email2 = UserMailer.forgot_password("jojo@yahoo.com", "Jojo Binks")
expect([email, email2]).to include_email_with_subject("Welcome!")
```


##### have_body_text(text)
Note: text can be either a String or a Regexp

This checks that the text of the body has the given body.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to have_body_text(/Hi Jojo Binks,/)
```


##### have_header(key, value)

This checks that the expected key/value pair is in the headers of the email.

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
expect(email).to have_header("X-Campaign", "1234abc")
```

#### Using the helpers when not testing in isolation

Don't. :)  Seriously, if you do just take a look at the helpers and use them as you wish.

### MiniTest

You will use EmailSpec in your tests the same way you use it in your specs. The only difference is the use of MiniTest's `must` instead of Rspec's `should`:

```ruby
email = UserMailer.create_signup("jojo@yahoo.com", "Jojo Binks")
email.must deliver_to("jojo@yahoo.com")
```

Or, you can use the matcher as an expectation:

```ruby
email = UserMailer.create_signup "jojo@yahoo.com", "Jojo Binks"
email.must_deliver_to "jojo@yahoo.com"
```

And of course you can use the matcher as an assertion:

```ruby
email = UserMailer.create_signup "jojo@yahoo.com", "Jojo Binks"
assert_must deliver_to("jojo@yahoo.com"), email
```

## Original Authors

Ben Mabey, Aaron Gibralter, Mischa Fierer

Please see [Changelog.md](Changelog.md) for upcoming changes and other contributors.
