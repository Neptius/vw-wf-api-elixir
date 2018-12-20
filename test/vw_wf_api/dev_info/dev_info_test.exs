defmodule VwWfApi.DevInfoTest do
  use VwWfApi.DataCase

  alias VwWfApi.DevInfo

  describe "dev_news" do
    alias VwWfApi.DevInfo.DevNew

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dev_new_fixture(attrs \\ %{}) do
      {:ok, dev_new} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DevInfo.create_dev_new()

      dev_new
    end

    test "list_dev_news/0 returns all dev_news" do
      dev_new = dev_new_fixture()
      assert DevInfo.list_dev_news() == [dev_new]
    end

    test "get_dev_new!/1 returns the dev_new with given id" do
      dev_new = dev_new_fixture()
      assert DevInfo.get_dev_new!(dev_new.id) == dev_new
    end

    test "create_dev_new/1 with valid data creates a dev_new" do
      assert {:ok, %DevNew{} = dev_new} = DevInfo.create_dev_new(@valid_attrs)
    end

    test "create_dev_new/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DevInfo.create_dev_new(@invalid_attrs)
    end

    test "update_dev_new/2 with valid data updates the dev_new" do
      dev_new = dev_new_fixture()
      assert {:ok, %DevNew{} = dev_new} = DevInfo.update_dev_new(dev_new, @update_attrs)
    end

    test "update_dev_new/2 with invalid data returns error changeset" do
      dev_new = dev_new_fixture()
      assert {:error, %Ecto.Changeset{}} = DevInfo.update_dev_new(dev_new, @invalid_attrs)
      assert dev_new == DevInfo.get_dev_new!(dev_new.id)
    end

    test "delete_dev_new/1 deletes the dev_new" do
      dev_new = dev_new_fixture()
      assert {:ok, %DevNew{}} = DevInfo.delete_dev_new(dev_new)
      assert_raise Ecto.NoResultsError, fn -> DevInfo.get_dev_new!(dev_new.id) end
    end

    test "change_dev_new/1 returns a dev_new changeset" do
      dev_new = dev_new_fixture()
      assert %Ecto.Changeset{} = DevInfo.change_dev_new(dev_new)
    end
  end

  describe "dev_news_tag" do
    alias VwWfApi.DevInfo.DevNewTag

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dev_new_tag_fixture(attrs \\ %{}) do
      {:ok, dev_new_tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DevInfo.create_dev_new_tag()

      dev_new_tag
    end

    test "list_dev_news_tag/0 returns all dev_news_tag" do
      dev_new_tag = dev_new_tag_fixture()
      assert DevInfo.list_dev_news_tag() == [dev_new_tag]
    end

    test "get_dev_new_tag!/1 returns the dev_new_tag with given id" do
      dev_new_tag = dev_new_tag_fixture()
      assert DevInfo.get_dev_new_tag!(dev_new_tag.id) == dev_new_tag
    end

    test "create_dev_new_tag/1 with valid data creates a dev_new_tag" do
      assert {:ok, %DevNewTag{} = dev_new_tag} = DevInfo.create_dev_new_tag(@valid_attrs)
    end

    test "create_dev_new_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DevInfo.create_dev_new_tag(@invalid_attrs)
    end

    test "update_dev_new_tag/2 with valid data updates the dev_new_tag" do
      dev_new_tag = dev_new_tag_fixture()
      assert {:ok, %DevNewTag{} = dev_new_tag} = DevInfo.update_dev_new_tag(dev_new_tag, @update_attrs)
    end

    test "update_dev_new_tag/2 with invalid data returns error changeset" do
      dev_new_tag = dev_new_tag_fixture()
      assert {:error, %Ecto.Changeset{}} = DevInfo.update_dev_new_tag(dev_new_tag, @invalid_attrs)
      assert dev_new_tag == DevInfo.get_dev_new_tag!(dev_new_tag.id)
    end

    test "delete_dev_new_tag/1 deletes the dev_new_tag" do
      dev_new_tag = dev_new_tag_fixture()
      assert {:ok, %DevNewTag{}} = DevInfo.delete_dev_new_tag(dev_new_tag)
      assert_raise Ecto.NoResultsError, fn -> DevInfo.get_dev_new_tag!(dev_new_tag.id) end
    end

    test "change_dev_new_tag/1 returns a dev_new_tag changeset" do
      dev_new_tag = dev_new_tag_fixture()
      assert %Ecto.Changeset{} = DevInfo.change_dev_new_tag(dev_new_tag)
    end
  end
end
