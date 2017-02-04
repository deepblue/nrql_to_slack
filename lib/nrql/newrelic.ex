defmodule Nrql.Newrelic do
  use HTTPoison.Base

  def process_url(url) do
    "https://insights-api.newrelic.com/v1/accounts/" <> account_id() <> url
  end

  defp process_request_headers(headers) do
    headers ++ [
      {"Content-Type", "application/json"},
      {"Accept", "application/json"},
      {"X-Query-Key", query_key()},
    ]
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

  defp account_id do
    Application.get_env(:newrelic, :account_id)
  end

  defp query_key do
    Application.get_env(:newrelic, :query_key)
  end

  def query!(nrql) do
    get!("/query?" <> URI.encode_query(%{nrql: nrql})).body
  end
end
