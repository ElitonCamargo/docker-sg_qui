import Redis from "ioredis";

const redis = new Redis({
  host: process.env.REDIS_HOST || "localhost",
  port: process.env.REDIS_PORT || 6379,
});

redis.on("connect", () => {
  console.log("✅ Conectado ao Redis com sucesso!");
});

redis.on("error", (err) => {
  console.error("❌ Erro ao conectar ao Redis:", err);
});

export default redis;
