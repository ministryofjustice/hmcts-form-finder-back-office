# HMCTS Form Finder Back Office

The HMCTS Form Finder Back Office app to maintain forms and leaflets.

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

```
rake staff:sample_users --Create two new users
```


##Testing

Run RSpec
```
rspec
```
