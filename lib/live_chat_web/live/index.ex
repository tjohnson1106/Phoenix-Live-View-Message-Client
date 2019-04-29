defmodule LiveChatWeb.Live.Index do
  use Phoenix.LiveView

  alias LiveChat.Chat
  alias LiveChat.Chat.Message

  def mount(_session, arg1) do
    if connected?(socket), do: Chat.subscribe()
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    LiveChatWeb.ChatView.render("index.html", assigns)
  end

  def fetch(socket, user_name \\ nil) do
    assign(socket, %{
      user_name: user_name,
      messages: Chat.list_messages(),
      changeset: Chat.change_message(%Message{username: user_name})
    })
  end

  defp get_user_name(socket) do
    socket.assigns
    |> Map.get(:user_name)
  end
end
