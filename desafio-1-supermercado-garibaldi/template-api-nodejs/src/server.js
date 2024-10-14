import fastify from "fastify";

import { prisma } from "./prisma.js";

const server = fastify({ logger: true });

// Busca todos os produtos
server.get("/api/products", async (request, response) => {
    const products = await prisma.produto.findMany();
    return response.status(200).send(products);
})

try {
    await server.listen({ port: 8080 });
} catch (error) {
    server.log.error(error);
    process.exit(1);
}
