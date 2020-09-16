# README

## Local machine setup

### Databases 
1.  Create the local databases needed for development and test by running the following script:
    
    `psql -h localhost -U postgres < db/recreate-local-databases.sh`
    
1.  Migrate the local database by running:

    `rails db:migrate`
    
### Running tests locally

To run the test suite locally, run:

    `bundle exec rspec`