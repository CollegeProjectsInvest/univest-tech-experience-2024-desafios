-- CreateTable
CREATE TABLE "categoria" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "produto" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "preco" REAL NOT NULL,
    "estoqueAtual" INTEGER NOT NULL,
    "dataValidade" DATETIME NOT NULL,
    "dataCadastro" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "categoriaId" TEXT NOT NULL,
    CONSTRAINT "produto_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "categoria" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "venda" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "dataVenda" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "vendaProduto" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "quantidadeProduto" INTEGER NOT NULL,
    "precoVenda" REAL NOT NULL,
    "produtoId" TEXT,
    "vendaId" TEXT,
    CONSTRAINT "vendaProduto_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produto" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "vendaProduto_vendaId_fkey" FOREIGN KEY ("vendaId") REFERENCES "venda" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "categoria_id_key" ON "categoria"("id");

-- CreateIndex
CREATE UNIQUE INDEX "produto_id_key" ON "produto"("id");

-- CreateIndex
CREATE UNIQUE INDEX "venda_id_key" ON "venda"("id");

-- CreateIndex
CREATE UNIQUE INDEX "vendaProduto_id_key" ON "vendaProduto"("id");
