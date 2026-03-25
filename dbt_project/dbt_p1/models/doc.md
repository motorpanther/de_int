{% docs gen %}

# to list all the tests
dbt ls --resource-type test

# bash with airflow
dbt run && dbt test
#it has to pass the test first to run

generate_schema_name is a default macros that has to be overwriten

# doc generation
 dbt docs generate
 dbt docs serve



# Freshness

freshness: #can be only in the table level
    #dbt source freshness
    #generate target/sources.json
    #CICD 
    #dbt source freshness --target prod --profiles-dir .
    # echo " dbt freshness failure!" | send_to_slack.sh
    # Slack webhook
    # SLACK_URL="https://hooks.slack.com/services/XXXX/YYYY/ZZZZ"

to see all freshness visually

dbt source freshness
dbt docs generate
dbt docs serve



yml anchor to create freshness schema level

version: 2

x-default-freshness: &default_freshness
  loaded_at_field: updated_at
  freshness:
    warn_after: {count: 1, period: day}
    error_after: {count: 2, period: day}

sources:
  - name: metadata
    schema: l1_landing
    tables:
      - name: customers
        <<: *default_freshness
      - name: orders
        <<: *default_freshness
      - name: orderitems
        <<: *default_freshness









{% enddocs %}