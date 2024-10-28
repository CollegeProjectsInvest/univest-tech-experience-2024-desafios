import fastify from "fastify";

import { prisma } from "./prisma.js";

const server = fastify({ logger: true });

// Busca todos os alunos
server.get("/api/students", async (request, response) => {
    const students = await prisma.aluno.findMany();
    return response.status(200).send(students);
});

try {
    await server.listen({ port: 8080 });
} catch (error) {
    server.log.error(error);
    process.exit(1);
}
