defmodule VwWfApiWeb.Resolvers.DevNew do
  alias VwWfApi.DevInfo

  def list_dev_news(_parent, _args, _resolution) do
    {:ok, DevInfo.list_dev_news()}
  end

  def create_dev_new(_parent, %{dev_new: dev_new}, _resolution) do
    DevInfo.create_dev_new(dev_new)
  end
end
