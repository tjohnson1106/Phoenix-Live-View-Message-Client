defmodule LiveChatWeb.ChatController do
  use LiveChatWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(
      conn,
      LiveChatWeb.Live.Index,
      session: %{}
    )
  end
end
