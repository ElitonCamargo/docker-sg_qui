// utils/sessoesCacheRedis.js
import redis from "../config/redis.js";

/**
 * Adiciona uma sessão no Redis com tempo de expiração definido.
 *
 * - Cria uma chave no formato `sessao:<usuario_id>`.
 * - O valor armazenado é o token do usuário.
 * - Define um TTL (tempo de vida) automático, em segundos.
 *
 * @param {number|string} usuario - ID do usuário.
 * @param {string} token - Token de sessão (gerado no login).
 * @param {number} [tempoEmSegundos=3600] - Tempo até expirar (padrão: 1 hora).
 */
export async function addSessao(usuario, token, tempoEmSegundos = 3600) {
  const chave = `sessao:${usuario}`;
  await redis.set(chave, token, "EX", tempoEmSegundos);
}

/**
 * Busca uma sessão ativa no Redis.
 *
 * - Retorna `true` se a sessão e o token forem válidos.
 * - Retorna `false` se a sessão não existir ou o token não coincidir.
 *
 * @param {number|string} usuario - ID do usuário.
 * @param {string} token - Token que será comparado.
 * @returns {Promise<boolean>}
 */
export async function buscarSessao(usuario, token) {
  const chave = `sessao:${usuario}`;
  const tokenSalvo = await redis.get(chave);
  return tokenSalvo === token;
}

/**
 * Estende a duração (TTL) da sessão no Redis.
 *
 * - Apenas renova o tempo de expiração, sem alterar o token.
 * - Útil para fluxos de "usuário ativo" ou "lembrar-me".
 *
 * @param {number|string} usuario - ID do usuário.
 * @param {number} tempoEmSegundos - Tempo adicional de validade.
 * @returns {Promise<boolean>} - Retorna `true` se o TTL foi atualizado.
 */
export async function extenderSessao(usuario, tempoEmSegundos) {
  const chave = `sessao:${usuario}`;
  const existe = await redis.exists(chave);
  if (!existe) return false;

  // Atualiza o TTL (Time To Live)
  await redis.expire(chave, tempoEmSegundos);
  return true;
}

/**
 * Remove uma sessão do Redis (logout ou expiração manual).
 *
 * @param {number|string} usuario - ID do usuário.
 * @returns {Promise<void>}
 */
export async function removerSessao(usuario) {
  const chave = `sessao:${usuario}`;
  await redis.del(chave);
}
