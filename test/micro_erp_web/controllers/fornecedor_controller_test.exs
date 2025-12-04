defmodule MicroErpWeb.FornecedorControllerTest do
  use MicroErpWeb.ConnCase

  import MicroErp.FornecedoresFixtures

  alias MicroErp.Fornecedores.Fornecedor

  @create_attrs %{
    nome: "some nome",
    cnpj: "some cnpj",
    contato: "some contato"
  }
  @update_attrs %{
    nome: "some updated nome",
    cnpj: "some updated cnpj",
    contato: "some updated contato"
  }
  @invalid_attrs %{nome: nil, cnpj: nil, contato: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all fornecedores", %{conn: conn} do
      conn = get(conn, ~p"/api/fornecedores")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create fornecedor" do
    test "renders fornecedor when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/fornecedores", fornecedor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/fornecedores/#{id}")

      assert %{
               "id" => ^id,
               "cnpj" => "some cnpj",
               "contato" => "some contato",
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/fornecedores", fornecedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update fornecedor" do
    setup [:create_fornecedor]

    test "renders fornecedor when data is valid", %{conn: conn, fornecedor: %Fornecedor{id: id} = fornecedor} do
      conn = put(conn, ~p"/api/fornecedores/#{fornecedor}", fornecedor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/fornecedores/#{id}")

      assert %{
               "id" => ^id,
               "cnpj" => "some updated cnpj",
               "contato" => "some updated contato",
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, fornecedor: fornecedor} do
      conn = put(conn, ~p"/api/fornecedores/#{fornecedor}", fornecedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete fornecedor" do
    setup [:create_fornecedor]

    test "deletes chosen fornecedor", %{conn: conn, fornecedor: fornecedor} do
      conn = delete(conn, ~p"/api/fornecedores/#{fornecedor}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/fornecedores/#{fornecedor}")
      end
    end
  end

  defp create_fornecedor(_) do
    fornecedor = fornecedor_fixture()
    %{fornecedor: fornecedor}
  end
end
