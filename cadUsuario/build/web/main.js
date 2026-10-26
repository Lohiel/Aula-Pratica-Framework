/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

$(document).ready(function () {
  function buscarCep() {
    var cep = $('#cep').val().replace(/\D/g, '');
    if (cep.length !== 8) return;

    $.getJSON('https://viacep.com.br/ws/' + cep + '/json/')
      .done(function (d) {
        if (d.erro) { alert('CEP não encontrado'); return; }
        $('#rua').val(d.logradouro);
        $('#bairro').val(d.bairro);
        $('#cidade').val(d.localidade);
        $('#estado').val(d.uf);
      })
      .fail(function () { alert('Erro ao consultar o CEP'); });
  }

  $('#cep').on('input blur', buscarCep);
});
