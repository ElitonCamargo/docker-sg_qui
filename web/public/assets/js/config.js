// Obter o protocolo (http ou https)
let protocolo = window.location.protocol;

// Obter o domínio (host)
let dominio =  (window.location.host).split(':')[0];

let porta = '8080';

//const urlApi = "http://x.x.x.x:8080"; //ip do servidor
const urlApi = `${protocolo}//${dominio}:${porta}`;

const opt = {
  "urlApi": urlApi,
  "urlLogar": `${urlApi}/usuario/login`,
  "urlElemento": `${urlApi}/elemento`,
  "urlNutriente": `${urlApi}/nutriente`,
  "urlMateriaPrima": `${urlApi}/materia_prima`,
  "urlGarantia": `${urlApi}/garantia`,
  "urlGarantiaMateriaPrima": `${urlApi}/garantia/materia_prima`,
  "urlProjeto": `${urlApi}/projeto`,
  "urlUsuario": `${urlApi}/usuario`,
  "urlEtapa": `${urlApi}/etapa`,
  "urlEtapaMp": `${urlApi}/etapa_mp`,
  "urlConfig": `${urlApi}/configuracao`,
  "usuario": `${urlApi}/usuario`
}



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
