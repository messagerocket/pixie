# Create a struct to handle outgoing connect responses.
# We don't do any validation here, as we're just building a data structure for
# the server to handle.

# Request                              Response
# MUST include:  * channel             MUST include:  * channel
#                * clientId                           * successful
#                * connectionType                     * clientId
# MAY include:   * ext                 MAY include:   * error
#                * id                                 * advice
#                                                     * ext
#                                                     * id
#                                                     * timestamp

defmodule Pixie.Response.Connect do
  defstruct channel: "/meta/connect", client_id: nil, error: nil, advice: nil, ext: nil, id: nil, timestamp: nil
  import Pixie.Response.Utils

  def init %Pixie.Message.Connect{}=message do
    %Pixie.Response.Connect{}
      |> put(message, :id)
      |> put(message, :client_id)
  end
end