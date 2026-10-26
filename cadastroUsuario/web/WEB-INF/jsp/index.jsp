<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark justify-content-center">
    <span class="navbar-brand mb-0 h1">Formulário de Cadastro</span>
</nav>

<div class="container mt-4">
    <form id="formCadastro" class="row g-3" novalidate>
        <div class="col-md-6"><label class="form-label">Nome</label><input type="text" id="nome" class="form-control" placeholder="Nome"></div>
        <div class="col-md-6"><label class="form-label">Sobrenome</label><input type="text" id="sobrenome" class="form-control" placeholder="Sobrenome"></div>
        <div class="col-md-6"><label class="form-label">Email</label><input type="email" id="email" class="form-control"></div>
        <div class="col-md-6"><label class="form-label">Senha</label><input type="password" id="senha" class="form-control"></div>

         <h5 class="mt-4">Endereço</h5>
      <div class="col-md-3">
        <label class="form-label">CEP</label>
        <input type="text" id="cep" class="form-control" maxlength="9" placeholder="Ex: 01001000">
        <div id="msgCep" class="form-text"></div>
      </div>
      <div class="col-md-5"><label class="form-label">Rua</label><input type="text" id="rua" class="form-control" placeholder="Rua"></div>
      <div class="col-md-4"><label class="form-label">Bairro</label><input type="text" id="bairro" class="form-control" placeholder="Bairro"></div>
      <div class="col-md-4"><label class="form-label">Cidade</label><input type="text" id="cidade" class="form-control"></div>
      <div class="col-md-2"><label class="form-label">Estado</label><input type="text" id="estado" class="form-control"></div>
      <div class="col-md-2"><label class="form-label">Número</label><input type="text" id="numero" class="form-control"></div>
      <div class="col-md-4"><label class="form-label">Complemento</label><input type="text" id="complemento" class="form-control"></div>

      <div class="col-12"><button type="submit" class="btn btn-dark">Verificar</button></div>
    </form>
  </div>

  <script>
    console.log('script do CEP carregou');

    var campoCep = document.getElementById('cep');
    var msg = document.getElementById('msgCep');

    function buscarCep() {
      var cep = campoCep.value.replace(/\D/g, '');
      if (cep.length !== 8) { msg.textContent = ''; return; }

      msg.textContent = 'Buscando...';
      console.log('Buscando CEP', cep);

      fetch('https://viacep.com.br/ws/' + cep + '/json/')
        .then(function (r) { return r.json(); })
        .then(function (d) {
          console.log('Resposta', d);
          if (d.erro) { msg.textContent = 'CEP não encontrado'; return; }
          document.getElementById('rua').value = d.logradouro;
          document.getElementById('bairro').value = d.bairro;
          document.getElementById('cidade').value = d.localidade;
          document.getElementById('estado').value = d.uf;
          msg.textContent = 'Endereço preenchido';
        })
        .catch(function (e) {
          console.log('Erro', e);
          msg.textContent = 'Erro ao consultar o CEP';
        });
    }

    campoCep.addEventListener('input', buscarCep);
    campoCep.addEventListener('blur', buscarCep);
        var form = document.getElementById('formCadastro');

    form.addEventListener('submit', function (e) {
      e.preventDefault(); // impede recarregar a página e apagar os campos

      var ids = ['nome', 'sobrenome', 'email', 'senha', 'cep', 'rua', 'bairro', 'cidade', 'estado', 'numero'];
      var valido = true;

      ids.forEach(function (id) {
        var campo = document.getElementById(id);
        if (campo.value.trim() === '') {
          campo.classList.remove('is-valid');
          campo.classList.add('is-invalid');
          valido = false;
        } else {
          campo.classList.remove('is-invalid');
          campo.classList.add('is-valid');
        }
      });

      if (valido) alert('Formulário preenchido corretamente!');
    });
  </script>
</body>
</html>