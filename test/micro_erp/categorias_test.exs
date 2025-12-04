defmodule MicroErp.CategoriasTest do
  use MicroErp.DataCase

  alias MicroErp.Categorias

  describe "categorias" do
    alias MicroErp.Categorias.Categoria

    import MicroErp.CategoriasFixtures

    @invalid_attrs %{nome: nil, descricao: nil}

    test "list_categorias/0 returns all categorias" do
      categoria = categoria_fixture()
      assert Categorias.list_categorias() == [categoria]
    end

    test "get_categoria!/1 returns the categoria with given id" do
      categoria = categoria_fixture()
      assert Categorias.get_categoria!(categoria.id) == categoria
    end

    test "create_categoria/1 with valid data creates a categoria" do
      valid_attrs = %{nome: "some nome", descricao: "some descricao"}

      assert {:ok, %Categoria{} = categoria} = Categorias.create_categoria(valid_attrs)
      assert categoria.nome == "some nome"
      assert categoria.descricao == "some descricao"
    end

    test "create_categoria/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categorias.create_categoria(@invalid_attrs)
    end

    test "update_categoria/2 with valid data updates the categoria" do
      categoria = categoria_fixture()
      update_attrs = %{nome: "some updated nome", descricao: "some updated descricao"}

      assert {:ok, %Categoria{} = categoria} = Categorias.update_categoria(categoria, update_attrs)
      assert categoria.nome == "some updated nome"
      assert categoria.descricao == "some updated descricao"
    end

    test "update_categoria/2 with invalid data returns error changeset" do
      categoria = categoria_fixture()
      assert {:error, %Ecto.Changeset{}} = Categorias.update_categoria(categoria, @invalid_attrs)
      assert categoria == Categorias.get_categoria!(categoria.id)
    end

    test "delete_categoria/1 deletes the categoria" do
      categoria = categoria_fixture()
      assert {:ok, %Categoria{}} = Categorias.delete_categoria(categoria)
      assert_raise Ecto.NoResultsError, fn -> Categorias.get_categoria!(categoria.id) end
    end

    test "change_categoria/1 returns a categoria changeset" do
      categoria = categoria_fixture()
      assert %Ecto.Changeset{} = Categorias.change_categoria(categoria)
    end
  end
end
