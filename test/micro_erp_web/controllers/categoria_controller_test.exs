defmodule MicroErpWeb.CategoriaControllerTest do
  use MicroErpWeb.ConnCase

  import MicroErp.CategoriasFixtures

  alias MicroErp.Categorias.Categoria

  @create_attrs %{
    nome: "some nome",
    descricao: "some descricao"
  }
  @update_attrs %{
    nome: "some updated nome",
    descricao: "some updated descricao"
  }
  @invalid_attrs %{nome: nil, descricao: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categorias", %{conn: conn} do
      conn = get(conn, ~p"/api/categorias")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create categoria" do
    test "renders categoria when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/categorias", categoria: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/categorias/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some descricao",
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/categorias", categoria: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update categoria" do
    setup [:create_categoria]

    test "renders categoria when data is valid", %{conn: conn, categoria: %Categoria{id: id} = categoria} do
      conn = put(conn, ~p"/api/categorias/#{categoria}", categoria: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/categorias/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao",
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, categoria: categoria} do
      conn = put(conn, ~p"/api/categorias/#{categoria}", categoria: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete categoria" do
    setup [:create_categoria]

    test "deletes chosen categoria", %{conn: conn, categoria: categoria} do
      conn = delete(conn, ~p"/api/categorias/#{categoria}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/categorias/#{categoria}")
      end
    end
  end

  defp create_categoria(_) do
    categoria = categoria_fixture()
    %{categoria: categoria}
  end
end
