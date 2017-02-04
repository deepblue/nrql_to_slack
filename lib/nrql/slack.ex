defmodule Nrql.Slack do
  use HTTPoison.Base

  def process_url(url) do
    "https://slack.com/api/" <> url
  end

  def post_message(channel, text, attachments \\ []) do
    post!("chat.postMessage",
      {:form, build_message(channel, text, attachments)},
      %{"Content-Type" => "application/x-www-form-urlencoded"}
    )
  end

  defp token do
    Application.get_env(:slack, :token)
  end

  defp build_message(channel, text, attachments) do
    [
      token: token(),
      channel: channel,
      text: text,
      attachments: Poison.encode!(attachments),
      as_user: "true"
    ]
  end
end
