-- CreateTable
CREATE TABLE "aluno" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "idade" INTEGER NOT NULL,
    "presenca" INTEGER NOT NULL,
    "notaOficial" INTEGER NOT NULL,
    "notaParcial" INTEGER NOT NULL,
    "atividadesEmSala" INTEGER NOT NULL,
    "atividadesExtracurriculares" INTEGER NOT NULL,
    "semestreId" TEXT NOT NULL,
    "disciplinaId" TEXT NOT NULL,
    CONSTRAINT "aluno_semestreId_fkey" FOREIGN KEY ("semestreId") REFERENCES "semestre" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "aluno_disciplinaId_fkey" FOREIGN KEY ("disciplinaId") REFERENCES "disciplina" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "semestre" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "periodo" TEXT NOT NULL,
    "ano" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "disciplina" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "quantidadeAulas" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "aluno_id_key" ON "aluno"("id");

-- CreateIndex
CREATE UNIQUE INDEX "semestre_id_key" ON "semestre"("id");

-- CreateIndex
CREATE UNIQUE INDEX "disciplina_id_key" ON "disciplina"("id");
