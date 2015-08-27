require Logger

defmodule Pixie.Response.Encoder do
  import Pixie.Utils.Map

  def encode %{}=response do
    response
      |> Map.from_struct
      |> make_successful
      |> filter_empty_keys
      |> camelize_keys
      |> Poison.encode!
  end

  def filter_empty_keys map do
    Enum.filter map, fn
      {_,v} when is_nil(v) ->
        false
      {_,v} when is_list(v) and length(v) == 0 ->
        false
      {_,v} when is_map(v) and length(v) == 0 ->
        false
      {_,_} ->
        true
    end
  end

  def make_successful response do
    Map.put response, :successful, Pixie.Response.successful?(response)
  end
end