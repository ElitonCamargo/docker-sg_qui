// // ...existing code...
// // Obter o protocolo (http ou https)
// let protocolo = window.location.protocol;

// // Obter o domínio (host)
// let dominio =  (window.location.host).split(':')[0];

// let porta = '3000';

// // Prioriza a variável injetada pelo servidor (window.__ENV.API_URL)
// // mudou para let para poder atualizar após fetch
// let urlApi = `${protocolo}//${dominio}:${porta}`;


// // Definir opt inicialmente (será atualizado se fetch retornar API_URL)
// const opt = {
//   "urlApi": urlApi,
//   "urlLogar": `${urlApi}/usuario/login`,
//   "urlElemento": `${urlApi}/elemento`,
//   "urlNutriente": `${urlApi}/nutriente`,
//   "urlMateriaPrima": `${urlApi}/materia_prima`,
//   "urlGarantia": `${urlApi}/garantia`,
//   "urlGarantiaMateriaPrima": `${urlApi}/garantia/materia_prima`,
//   "urlProjeto": `${urlApi}/projeto`,
//   "urlUsuario": `${urlApi}/usuario`,
//   "urlEtapa": `${urlApi}/etapa`,
//   "urlEtapaMp": `${urlApi}/etapa_mp`,
//   "urlConfig": `${urlApi}/configuracao`,
//   "usuario": `${urlApi}/usuario`
// }

let opt = {};
// Usar caminho relativo e receber JSON
fetch('/env-config')
  .then(response => {
    if (!response.ok) throw new Error('Erro ao buscar /env-config');
    return response.json();
  })
  .then(data => {
    if (data && data.API_URL) {
      urlApi = data.API_URL; // atualiza a URL da API
      // se quiser, exponha globalmente
      window.__ENV = window.__ENV || {};
      window.__ENV.API_URL = data.API_URL;
      console.log('URL API atualizada:', urlApi);
      // Atualiza variáveis derivadas (se existirem depois do fetch)
      opt.urlApi = urlApi;
      opt.urlLogar = `${urlApi}/usuario/login`;
      opt.urlElemento = `${urlApi}/elemento`;
      opt.urlNutriente = `${urlApi}/nutriente`;
      opt.urlMateriaPrima = `${urlApi}/materia_prima`;
      opt.urlGarantia = `${urlApi}/garantia`;
      opt.urlGarantiaMateriaPrima = `${urlApi}/garantia/materia_prima`;
      opt.urlProjeto = `${urlApi}/projeto`;
      opt.urlUsuario = `${urlApi}/usuario`;
      opt.urlEtapa = `${urlApi}/etapa`;
      opt.urlEtapaMp = `${urlApi}/etapa_mp`;
      opt.urlConfig = `${urlApi}/configuracao`;
      opt.usuario = `${urlApi}/usuario`;
    }
  })
  .catch(error => {
  console.error('Erro ao carregar configuração:', error);
});

const selectsProjeto = {
  status: [
    "Não Iniciado",
    'Inicializando',
    "Em Andamento",
    "Finalizado"
  ],
  natureza: [
    "Fluido (Solução)",
    "Fluido (Suspensão)",
    "Susp. Concentrada",
    "Sólido"
  ],
  tipoFertilizante: [
    "Mineral Misto/Simples",
    "Organomineral"
  ],
  modoAplicacao: [
    "Foliar",
    "Fertirrigação",
    "Solo",
    "Hidroponia",
    "Semente"
  ]
};
