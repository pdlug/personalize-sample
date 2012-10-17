# TODO Items

Below is a list of items that a system like this *might* have.

## Bugs

* There are some existing specs that have been intentionally left incomplete/failing/pending.

## Minor Improvements

* Implement uniqueness by username for the User document (see
spec/functional/models/user_spec.rb)
* Implement a user friendly unauthorized exception page for failed
logins.
* Encrypt passwords

## Major Features

* Implement a sign up sequence including:
 * Error handling - what if a username is taken? password confirmation
doesn't match? etc.
 * Validation - ensure that the username matches the valid format and
the email appears to be a valid email address. Appropriate error
messages should be displayed.
 * Welcome email - send the user an email welcoming them to the system.
 * Email confirmation - send the user an email with a link they must
visit to validate and link their email address to the account. The data
model should track whether or not the email for a user has been properly
validated.
* Implement "sticky" log in's using cookies so the user doesn't have to
log in every time.
 * Expire these sticky log in's after 1hr forcing the user to sign in
again.
* Implement the user "homepage" (page they see when the log in)
 * Show all alerts available in the system with a checkbox next to
them.
 * Allow the user to select/deselect alerts to subscribe to and
persist their choices

## Development/Test Improvements

* Bootstrap the initial list of available alerts from a YAML or other
file in the config directory (or a data directory) rather than code in
the configure block of the sinatra app.

* Clear out the test database prior to every run to ensure all tests
are run in a fresh environment.

* Use [factory_girl](https://github.com/thoughtbot/factory_girl) or
something similar to generate fixtures for specs.
