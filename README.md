# Framework para Desenvolvimento de Software: Aulas Práticas

Repositório com as quatro aulas práticas da disciplina **Framework para Desenvolvimento de Software** (Engenharia de Software, 6º semestre). As atividades são encadeadas: do ambiente com servidor Tomcat até um formulário de cadastro com consulta de CEP e validação de campos.

## Atividades

| # | Projeto | Descrição | Tecnologias |
|---|---------|-----------|-------------|
| 1 | `Aplicação Web` | Configuração do Tomcat no NetBeans e projeto-teste com Spring Web MVC | NetBeans, Tomcat 9, Spring Web MVC |
| 2 | `cadastroEndereço` | Formulário de endereço que preenche rua, bairro, cidade e estado a partir do CEP | HTML5, CSS3, JavaScript, Bootstrap 5, ViaCEP |
| 3 | `cadastroUsuario` | Formulário de cadastro com 11 campos, estilizado, com busca de CEP | Spring Web MVC, JSP, Bootstrap 5, ViaCEP |
| 4 | `cadUsuario` | Cadastro de cliente com validação de campos e e-mail (regex) | HTML5, Bootstrap 5, jQuery, ViaCEP |

## Estrutura do repositório

```
.
├── Aplicação Web/        # Atividade 1: Tomcat + projeto Spring de teste
├── cadastroEndereço/     # Atividade 2: formulário de endereço com ViaCEP
├── cadastroUsuario/      # Atividade 3: cadastro com Spring MVC + Bootstrap 5
├── cadUsuario/           # Atividade 4: cadastro com validação em jQuery
└── README.md
```

Cada pasta é um projeto NetBeans (Java Web Application) que roda no Tomcat.

## Pré-requisitos

- **JDK** 8 ou superior
- **Apache NetBeans** (recomendado 12 ou superior)
- **Apache Tomcat 9** (64-bit Windows zip), extraído em `C:\apache-tomcat-9.0.xx`
- Conexão com a internet (Bootstrap, jQuery e ViaCEP são carregados por CDN/API)

> O roteiro pede Tomcat 8.x, mas o ramo 8.5 teve o suporte encerrado. O Tomcat 9 ainda usa o namespace `javax.*`, compatível com o Spring 4.3.x. **Não use Tomcat 10 ou superior** (`jakarta.*`).

## Como executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/Lohiel/Aula-Pratica-Framework.git
   cd Aula-Pratica-Framework
   ```
2. No NetBeans, abra o projeto desejado em **File > Open Project**.
3. Registre o Tomcat, se ainda não estiver registrado: aba **Services** > **Servers** > **Add Server** > **Apache Tomcat or TomEE**, e informe a pasta do Tomcat em *Server Location*.
4. Clique com o botão direito no projeto > **Clean and Build** e depois **Run** (F6).
5. Acesse no navegador (o NetBeans abre sozinho):

O endereço segue o nome do projeto no NetBeans: `http://localhost:8080/<nome-do-projeto>/`. Se o nome do projeto tiver espaço ou acento (como `Aplicação Web` e `cadastroEndereço`), confira o endereço exato que o NetBeans abriu.

Se a porta 8080 estiver ocupada, veja o PID com `netstat -ano | findstr :8080` e encerre com `taskkill /PID <número> /F`.

## Funcionalidades

**Consulta de CEP (Atividades 2, 3 e 4):** ao digitar os 8 dígitos do CEP, a aplicação consulta a [ViaCEP](https://viacep.com.br/) e preenche rua, bairro, cidade e estado. Para testar, use `01001000`.

**Validação (Atividades 3 e 4):** o botão **Verificar** impede o envio padrão do formulário (`preventDefault`), marca campos vazios como inválidos e os preenchidos como válidos (classes `is-invalid` e `is-valid` do Bootstrap). Na Atividade 4, o e-mail também é conferido por expressão regular:

```javascript
var regexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
```


## Referências

- [Apache Tomcat](https://tomcat.apache.org)
- [Spring Web MVC no NetBeans](https://netbeans.apache.org/kb/docs/web/quickstart-webapps-spring_pt_BR.html)
- [Bootstrap 5](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- [ViaCEP](https://viacep.com.br/)

## Autor

**Lohan**: Engenharia de Software, 6º semestre
