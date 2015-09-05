defmodule Pixie.Message.Subscribe do
  defstruct channel: nil, client_id: nil, subscription: nil, ext: nil, id: nil
  import Pixie.Utils.Message

  @moduledoc """
  Convert an incoming subscription request into a struct.

      Request
      MUST include:  * channel
                     * clientId
                     * subscription
      MAY include:   * ext
                     * id

  This struct contains the following keys:

    - `:channel` always `"/meta/subscribe"`.
    - `:subscription` the channel the user wishes to subscribe to.
    - `:client_id` the client ID generated by the server during handshake.
    - `:ext` an arbitrary map of data the client sent for use in extensions
      (usually authentication information, etc). Optional.
    - `:id` a message ID generated by the client. Optional.
  """

  @doc """
  Convert the incoming message into a `Pixie.Message.Subscribe` by copying
  only those fields we care about.
  """
  def init %{}=message do
    %Pixie.Message.Subscribe{}
      |> get(message, :channel)
      |> get(message, :client_id)
      |> get(message, :subscription)
      |> get(message, :ext)
      |> get(message, :id)
  end
end
