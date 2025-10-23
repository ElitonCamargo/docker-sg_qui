const rotas = [{
        'path': '',
        'component': '/page/home.html'
    },
    {
        'path': '/',
        'component': '/page/home.html'
    },
    {
        'path': '/elemento/cadastrar',
        'component': '/page/elemento.cadastrar.html'
    },
    {
        'path': '/elemento/listar',
        'component': '/page/elemento.listar.html'
    },
    {
        'path': '/nutrientes/cadastrar',
        'component': '/page/nutrientes.cadastrar.html'
    },
    {
        'path': '/nutrientes/listar',
        'component': '/page/nutrientes.listar.html'
    },
    {
        'path': '/materia_prima/cadastrar',
        'component': '/page/materia_prima.cadastrar.html'
    },
    {
        'path': '/materia_prima/listar',
        'component': '/page/materia_prima.listar.html'
    },
    {
        'path': '/projeto/cadastrar',
        'component': '/page/projeto.cadastrar.html'
    },
    {
        'path': '/projetos/listar',
        'component': '/page/projeto.listar.html'
    },
    {
        'path': '/projeto/detalhado',
        'component': '/page/projeto.etapa.html'
    },
    {
        'path': '/usuario/cadastrar',
        'component': '/page/usuario.cadastrar.html'
    },
    {
        'path': '/usuario/listar',
        'component': '/page/usuario.listar.html'
    },
    {
        'path': '/configuracao',
        'component': '/page/configuracoes.html'
    },
];

const rotear = (rotaUrl = window.location.pathname) => {
    const rotaEncontrada = rotas.find(rota => rota.path.toLowerCase() === rotaUrl.toLowerCase());
    return rotaEncontrada || {
        path: '/error',
        component: '/page/erro.html'
    };
}


$(function () {

    let rota = rotear();

    if (getSessionData('tk')) {
        if (rota) {
            $("#root").empty();
            $("#root").load(rota.component);
        } else {
            $("#root").load('/page/erro.html');
        }
    }
});