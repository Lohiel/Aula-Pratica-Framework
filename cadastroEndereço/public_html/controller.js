document.getElementById('cep').addEventListener('blur', function () {
  const cep = this.value.replace(/\D/g, '');
  if (cep.length !== 8) { alert('CEP inválido'); return; }

  fetch(`https://viacep.com.br/ws/${cep}/json/`)
    .then(r => r.json())
    .then(d => {
      if (d.erro) { alert('CEP não encontrado'); return; }
      document.getElementById('rua').value = d.logradouro;
      document.getElementById('bairro').value = d.bairro;
      document.getElementById('cidade').value = d.localidade;
      document.getElementById('estado').value = d.uf;
    })
    .catch(() => alert('Erro ao consultar o CEP'));
});