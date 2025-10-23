$(function () {
    $.extend(true, $.fn.dataTable.defaults, {
        pagingType: 'simple_numbers',
        "pageLength": 5,
        "lengthMenu": [[5,10, 50, 100, 500, -1], [5,10, 50, 100, 500, "Todos"]],
        language: {
            buttons: {
                copy: "Copiar para Excel",
                print: 'Imprimir',
                copyTitle: 'Copiado para Excel',
                copyKeys: 'Pressione <i> ctrl </ i> ou <i> \ u2318 </ i> + <i> C </ i> para copiar os dados da tabela para a área de transferência. <br> <br> Para cancelar, clique nesta mensagem ou pressione Esc.',
                copySuccess: {
                    _: '%d registros copiados',
                    1: '1 registro copiado'
                }
            },
            "emptyTable": "Nenhum dado disponível na tabela",
            "info": "Mostrando de _START_ à _END_ de _TOTAL_ entradas",
            "infoEmpty": "Mostrando 0 de 0 a 0 entradas",
            "infoFiltered": "(filtrando de _MAX_ entradas totais)",
            "infoPostFix": "",
            "lengthMenu": "Mostrar _MENU_ entradas",
            "loadingRecords": "Carregando...",
            "processing": "Processando...",
            "search": "Busca em Tudo:",
            "zeroRecords": "Nenhum registro correspondente encontrado!",
            "paginate": {
                "first": "Primeiro",
                "last": "Último",
                "next": "Próximo",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": ativar para classificar coluna ascendente",
                "sortDescending": ": ativar para classificar coluna descendente"
            },
            "decimal": ",",
            "thousands": "."
        }
    });

});

//filtra sem acentos
function accents_supr(data) {
    return !data ?
        '' :
        typeof data === 'string' ?
            data
                .replace(/\n/g, ' ')
                .replace(/[áàäâ]/g, 'a')
                .replace(/[éèëê]/g, 'e')
                .replace(/[íìïî]/g, 'i')
                .replace(/[óòöô]/g, 'o')
                .replace(/[úùüû]/g, 'u') :
            data;
    jQuery.extend(jQuery.fn.dataTableExt.oSort,
        {
            "brasil-string-asc": function (s1, s2) {
                return s1.localeCompare(s2);
            },
            "brasil-string-desc": function (s1, s2) {
                return s2.localeCompare(s1);
            }
        });
    jQuery.fn.DataTable.ext.type.search['brasil-string'] = function (data) {
        return accents_supr(data);
    }
}
;

//clear filters

