defmodule VwWfApi.AccountsTest do
  use VwWfApi.DataCase

  alias VwWfApi.Accounts

  describe "users" do
    alias VwWfApi.Accounts.User

    @valid_attrs %{
      avatar: "some avatar",
      avatarfull: "some avatarfull",
      avatarmedium: "some avatarmedium",
      personaname: "some personaname",
      profileurl: "some profileurl",
      steamid: "some steamid"
    }
    @update_attrs %{
      avatar: "some updated avatar",
      avatarfull: "some updated avatarfull",
      avatarmedium: "some updated avatarmedium",
      personaname: "some updated personaname",
      profileurl: "some updated profileurl",
      steamid: "some updated steamid"
    }
    @invalid_attrs %{
      avatar: nil,
      avatarfull: nil,
      avatarmedium: nil,
      personaname: nil,
      profileurl: nil,
      steamid: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.avatarfull == "some avatarfull"
      assert user.avatarmedium == "some avatarmedium"
      assert user.personaname == "some personaname"
      assert user.profileurl == "some profileurl"
      assert user.steamid == "some steamid"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.avatarfull == "some updated avatarfull"
      assert user.avatarmedium == "some updated avatarmedium"
      assert user.personaname == "some updated personaname"
      assert user.profileurl == "some updated profileurl"
      assert user.steamid == "some updated steamid"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
