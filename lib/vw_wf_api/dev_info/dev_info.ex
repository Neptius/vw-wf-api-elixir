defmodule VwWfApi.DevInfo do
  @moduledoc """
  The DevInfo context.
  """

  import Ecto.Query, warn: false
  alias VwWfApi.Repo

  alias VwWfApi.DevInfo.DevNew

  @doc """
  Returns the list of dev_news.

  ## Examples

      iex> list_dev_news()
      [%DevNew{}, ...]

  """
  def list_dev_news do
    Repo.all(DevNew)
  end

  @doc """
  Gets a single dev_new.

  Raises `Ecto.NoResultsError` if the Dev new does not exist.

  ## Examples

      iex> get_dev_new!(123)
      %DevNew{}

      iex> get_dev_new!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dev_new!(id), do: Repo.get!(DevNew, id)

  @doc """
  Creates a dev_new.

  ## Examples

      iex> create_dev_new(%{field: value})
      {:ok, %DevNew{}}

      iex> create_dev_new(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dev_new(attrs \\ %{}) do
    %DevNew{}
    |> DevNew.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dev_new.

  ## Examples

      iex> update_dev_new(dev_new, %{field: new_value})
      {:ok, %DevNew{}}

      iex> update_dev_new(dev_new, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dev_new(%DevNew{} = dev_new, attrs) do
    dev_new
    |> DevNew.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DevNew.

  ## Examples

      iex> delete_dev_new(dev_new)
      {:ok, %DevNew{}}

      iex> delete_dev_new(dev_new)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dev_new(%DevNew{} = dev_new) do
    Repo.delete(dev_new)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dev_new changes.

  ## Examples

      iex> change_dev_new(dev_new)
      %Ecto.Changeset{source: %DevNew{}}

  """
  def change_dev_new(%DevNew{} = dev_new) do
    DevNew.changeset(dev_new, %{})
  end

  alias VwWfApi.DevInfo.DevNewTag

  @doc """
  Returns the list of dev_news_tag.

  ## Examples

      iex> list_dev_news_tag()
      [%DevNewTag{}, ...]

  """
  def list_dev_news_tag do
    Repo.all(DevNewTag)
  end

  @doc """
  Gets a single dev_new_tag.

  Raises `Ecto.NoResultsError` if the Dev new tag does not exist.

  ## Examples

      iex> get_dev_new_tag!(123)
      %DevNewTag{}

      iex> get_dev_new_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dev_new_tag!(id), do: Repo.get!(DevNewTag, id)

  @doc """
  Creates a dev_new_tag.

  ## Examples

      iex> create_dev_new_tag(%{field: value})
      {:ok, %DevNewTag{}}

      iex> create_dev_new_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dev_new_tag(attrs \\ %{}) do
    %DevNewTag{}
    |> DevNewTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dev_new_tag.

  ## Examples

      iex> update_dev_new_tag(dev_new_tag, %{field: new_value})
      {:ok, %DevNewTag{}}

      iex> update_dev_new_tag(dev_new_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dev_new_tag(%DevNewTag{} = dev_new_tag, attrs) do
    dev_new_tag
    |> DevNewTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DevNewTag.

  ## Examples

      iex> delete_dev_new_tag(dev_new_tag)
      {:ok, %DevNewTag{}}

      iex> delete_dev_new_tag(dev_new_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dev_new_tag(%DevNewTag{} = dev_new_tag) do
    Repo.delete(dev_new_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dev_new_tag changes.

  ## Examples

      iex> change_dev_new_tag(dev_new_tag)
      %Ecto.Changeset{source: %DevNewTag{}}

  """
  def change_dev_new_tag(%DevNewTag{} = dev_new_tag) do
    DevNewTag.changeset(dev_new_tag, %{})
  end
end
