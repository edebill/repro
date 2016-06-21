# This is a repro case for what I think is a bug in ActiveRecord

If you have a JSON column in your Postgres DB, it's harder than it used to be
to use that column in a where clause. We sometimes do this, and it broke some
of our code when we upgraded to Rails 5.0.0.rc1.
