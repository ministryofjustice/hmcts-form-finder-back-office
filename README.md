# HMCTS Form Finder Back Office

The HMCTS Form Finder Back Office app to maintain forms and leaflets.

[![Code Climate](https://lima.codeclimate.com/github/ministryofjustice/hmcts-form-finder-back-office/badges/gpa.svg)](https://lima.codeclimate.com/github/ministryofjustice/hmcts-form-finder-back-office)
[![Test Coverage](https://lima.codeclimate.com/github/ministryofjustice/hmcts-form-finder-back-office/badges/coverage.svg)](https://lima.codeclimate.com/github/ministryofjustice/hmcts-form-finder-back-office/coverage)

## S3 for document storage
AWS S3 the **default** document storage mechanism. It is stubbed out
using webmock for all tests, but active in development mode.

```
DEV_FORM_FINDER_S3_BUCKET     = <AWS bucket name> # Required
DEV_FORM_FINDER_S3_ACCESS_KEY = <AWS secret key>  # Required
DEV_FORM_FINDER_S3_SECRET_KEY = <AWS secret key>  # Required
DEV_FORM_FINDER_S3_REGION     = <AWS Region name> # Required
```


## Setting up development environment

Install gems

```
bundle install
```
Put the following environment variables into your shell profile

```
export COMMS_STAFF_PASSWORD='whatever'
```

Setup the database
```
rake db:create
rake db:migrate
rake db:seed
```

## Other useful rake tasks

It's done using devise and devise invitable:

https://github.com/plataformatec/devise
https://github.com/scambra/devise_invitable

You can create users with a rake task.

```
rake "user:create[admin@admin.com, 123456789, admin, test]" to create a user.
```


##Testing

Run RSpec
```
rspec
```
