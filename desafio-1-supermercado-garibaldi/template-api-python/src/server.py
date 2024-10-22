from sqlite3 import connect, Connection, Row
from flask import Flask, jsonify, Response


server: Flask = Flask(__name__)

DATABASE: str = "database.db"


def connection_database() -> Connection:
    """
    Cria, configura e retorna uma conexão com o Banco de Dados
    :return: Conexão com o Banco de Dados
    """
    connection: Connection = connect(DATABASE)
    connection.row_factory = Row
    return connection


# Rotas
@server.get("/api/products")
def get_products() -> tuple[Response, int]:
    """
    Rota GET "/api/products", para buscar todos os produtos do Banco de Dados
    :return: Lista de Produtos cadastrados no Banco de Dados
    """
    database: Connection = connection_database()
    cursor = database.execute("SELECT * FROM produto")

    products = cursor.fetchall()

    return jsonify([dict(product) for product in products]), 200


if __name__ == "__main__":
    server.run(debug=True)
