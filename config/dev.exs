use Mix.Config

config :newrelic,
  account_id: "NEWRELIC_ACCOUNT_ID",
  query_key: "NEWRELIC_QUERY_KEY"

config :slack,
  channel: "SLACK_CHANNEL",
  token: "SLACK_TOKEN"

config :nrql,
  queries: [
    {
      "Average duration",
      "SELECT average(duration) FROM PageView"
    },
  ]
