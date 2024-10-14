# Template API Nodejs

## Requisitos:
- Nodejs versão 20.X

## Configurar Banco de Dados
- Baixe o arquivo _**database.db**_ localizado dentro da pasta do desafio.
- Coloque esse arquivo dentro da pasta _**prisma**_, ficando dessa forma:

```shell
prisma/
|-- migrations/
|-- schema.prisma
|-- database.db # coloque o arquivo aqui
src/
```

- renomeie o arquivo _**.env.example**_ para _**.env**_

## Rodar projeto

Com o Nodejs instalado, rode o seguinte comando dentro da raiz do projeto

```bash
npm install
```

Iniciar o projeto, rode o comando

```bash
npm start
```

Agora sua API está rodando localmente em _**http://localhost:8080**_

Caso queira visualizar o Banco de Dados o Prisma oferece uma ferramente, rode o comando:

```bash
npm run prisma:studio
```
