/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var url = window.location.href
url = url.substring(0, url.lastIndexOf('/'));


$(document).ready(function () {
    atualizaTabela();
});


$(document).on('click', '.btn-listar', function () {
    atualizaTabela();

})



$(document).on('click', '.btn-cadastrar', function () {

    var nome = $("#inputNome").val();


    if (nome === null || nome === undefined || nome === "" || nome === " ") {
        alert("Por favor preencha antes de cadastrar");
    } else {
        var json = {};

        $("#inputNome").val("");
        json['nome'] = nome;


        $.ajax({
            url: `${url}/api/cartorios/`,
            type: "POST",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(json),
            success: function (data) {
                $('.fade').trigger('click');
                atualizaTabela();
            }, error: function (data) {
                alert("Por favor preencha antes de cadastrar");
            }
        });
    }
});



$(document).on('click', '.btn-pesquisar', function () {

    var id = $("#inputId").val();

    $.ajax({
        url: `${url}/api/cartorios/${id}`,
        type: "GET",
        success: function (data) {

            $("tbody").empty();
            $("tbody").append(`
                    <tr id=${data.id}>
                    <td class="id">${data.id}</td>
                    <td class="nome">${data.nome}</td>
                    <td class="centralizar">
                    <button type="button" class="btn btn-primary btn-sm btn-editar btn-tr" data-toggle="modal" data-target="#modal-atualizar">Editar</button>
                     <button type="button" class="btn btn-danger btn-sm btn-excluir">Excluir</button>
                    </td>
                    </tr>
                `)

            $("tbody").append("</tbody></table>")

            $('.fade').trigger('click');

        }, error: function (data) {
                alert("Cartorio inexistente");
            }
    });

});



$(document).on('click', '.btn-editar', function () {
    var idSelecionado = $(this).parents().parents().attr('id');
    var textoAtual = $(this).parents().parents()[0];
    console.log(textoAtual)
    textoAtual = $(textoAtual).find('td.nome').text().trim();
    console.log(textoAtual)
    $(".inputNomeAtualizar").attr("id", idSelecionado);
    $(".inputNomeAtualizar").val(textoAtual);


});



$(document).on('click', '.btn-atualizar', function () {
//ocorre depois da chamada do modal
    var nome = $(".inputNomeAtualizar").val();



    if (nome === null || nome === undefined || nome === "" || nome === " ") {
        alert("Por favor preencha antes de atualizar");
    } else {

        var id = $(".inputNomeAtualizar").attr('id');
        var json = {};

        json['nome'] = nome;

        $.ajax({
            url: `${url}/api/cartorios/${id}`,
            type: "PUT",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(json),
            success: function (data) {
                $("#inputNomeAtualizar").val('');
                atualizaTabela();
                $('.fade').trigger('click');
            }, error: function (data) {
                alert("Por favor preencha antes de atualizar");
            }
        });
    }


});


$(document).on('click', '.btn-excluir', function () {

    var id = $(this).parent().parent().attr('id');
    var linha = $(this).parent().parent();

    $.ajax({
        url: `${url}/api/cartorios/${id}`,
        type: "DELETE",
        success: function (data) {
            $(linha).empty();
        }
    });

});

function atualizaTabela() {
    $.ajax({
        url: `${url}/api/cartorios/`,
        type: "GET",
        success: function (data) {
            $("tbody").empty();
            for (var i in data) {
                $("tbody").append(`
                    <tr id=${data[i].id}>
                    <td class="id">${data[i].id}</td>
                    <td class="nome">${data[i].nome}</td>
                    <td class="centralizar">
                    <button type="button" class="btn btn-primary btn-sm btn-editar btn-tr" data-toggle="modal" data-target="#modal-atualizar">Editar</button> 
                    <button type="button" class="btn btn-danger btn-sm btn-excluir">Excluir</button>
                    </td>
                    </tr>
                `)
            }
            $("tbody").append("</tbody></table>")
        }
    });
}
