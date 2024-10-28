from sqlite3 import connect, Connection, Row, Cursor
from flask import Flask, jsonify, Response


# Banco de Dados
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
server: Flask = Flask(__name__)


@server.get("/api/students")
def get_students() -> tuple[Response, int]:
    """
    Rota GET "/api/students", para buscar todos os alunos do Banco de Dados
    :return: Lista de Alunos cadastrados no Banco de Dados
    """
    database: Connection = connection_database()
    cursor: Cursor = database.execute("SELECT * FROM aluno")

    students: list[any] = cursor.fetchall()

    return jsonify([dict(student) for student in students]), 200


if __name__ == "__main__":
    server.run(debug=True, port=8080)
