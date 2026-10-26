/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


$(document).ready(function () {
  var regexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  var obrigatorios = ['nome', 'sobrenome', 'email', 'senha', 'cep', 'rua', 'bairro', 'cidade', 'estado', 'numero'];

  $('#formCadastro').submit(function (e) {
    e.preventDefault();
    var valido = true;

    $.each(obrigatorios, function (i, id) {
      var campo = $('#' + id);
      if ($.trim(campo.val()) === '') {
        campo.removeClass('is-valid').addClass('is-invalid');
        valido = false;
      } else {
        campo.removeClass('is-invalid').addClass('is-valid');
      }
    });

    var email = $.trim($('#email').val());
    if (email !== '' && !regexEmail.test(email)) {
      $('#email').removeClass('is-valid').addClass('is-invalid');
      valido = false;
      alert('E-mail inválido');
    }

    if (valido) alert('Cadastro validado com sucesso!');
  });
});