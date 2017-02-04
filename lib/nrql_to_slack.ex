defmodule Nrql do
  def main(_args) do
    queries() |> Enum.each(&process_query/1)
  end

  defp process_query({text, nrql}) do
    attachments = nrql |> Nrql.Newrelic.query! |> format
    post_message(text, attachments)
  end

  defp post_message(_, []), do: nil
  defp post_message(text, attachments), do: Nrql.Slack.post_message(channel(), text, attachments)

  defp queries, do: Application.get_env(:nrql, :queries)

  defp channel, do: Application.get_env(:slack, :channel)

  defp format(%{"facets" => facets}), do: facets |> Enum.map(&format/1) |> Enum.reject(fn(x) -> x == nil end)
  defp format(%{"name" => name, "results" => [%{"count" => count}]}),
    do: %{fields: [%{title: "Name", value: name, short: true}, %{title: "Count", value: count, short: true}]}
  defp format(_), do: nil
end
