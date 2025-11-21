# 🗂️ Repository Templates

Este documento reúne **todos os templates essenciais** para um repositório GitHub profissional:
- Issue Template
- Pull Request Template
- Contributing Guidelines

Use este arquivo para copiar e criar os diretórios:
```
.github/ISSUE_TEMPLATE/
.github/pull_request_template.md
CONTRIBUTING.md
```

---

# 📌 ISSUE TEMPLATE — *Bug Report*
Crie em: `.github/ISSUE_TEMPLATE/bug_report.md`

```markdown
---
name: "Bug Report"
about: "Reporte um problema no projeto"
title: "[BUG] Descreva o problema aqui"
labels: bug
assignees: ''
---

## 🐞 Descrição do Bug
Explique claramente o que está acontecendo.

## 🔁 Passos para Reproduzir
1. Vá para '...'
2. Clique em '...'
3. Veja o erro

## 📸 Capturas de tela
Se aplicável, adicione imagens.

## 📦 Ambiente
- Sistema operacional:
- Banco de dados / versão:
- Navegador (se aplicável):

## 📄 Logs relevantes
Cole aqui quaisquer mensagens de erro.
```

---

# 📌 ISSUE TEMPLATE — *Feature Request*
Crie em: `.github/ISSUE_TEMPLATE/feature_request.md`

```markdown
---
name: "Feature Request"
about: "Sugira uma melhoria ou nova funcionalidade"
title: "[FEATURE] Descreva a nova funcionalidade"
labels: enhancement
assignees: ''
---

## 🌟 Descrição da melhoria
O que deve ser adicionado ou alterado?

## 🎯 Justificativa
Por que essa funcionalidade é útil?

## 🔧 Implementação sugerida
Explique como imagina a solução.
```

---

# 📌 PULL REQUEST TEMPLATE
Crie em: `.github/pull_request_template.md`

```markdown
# 📥 Pull Request

## 📌 Descrição
Explique o que foi alterado e por quê.

## 🔄 Tipo de mudança
- [ ] Bug fix
- [ ] Nova funcionalidade
- [ ] Alteração de estrutura
- [ ] Documentação

## ✅ Checklist
- [ ] Código segue o estilo do projeto
- [ ] Testes atualizados/criados
- [ ] Documentação atualizada
- [ ] Não existem warnings no build

## 🔗 Issues relacionadas
Use: closes #123 ou relates-to #123
```

---

# 📌 CONTRIBUTING.md
Crie na raiz do repositório: `CONTRIBUTING.md`

```markdown
# 🤝 Guia de Contribuição
Obrigado por considerar contribuir para este projeto!

## 📦 Como começar
1. Faça um fork do repositório
2. Crie uma branch:
   ```bash
   git checkout -b feature/nome-da-feature
   ```
3. Faça suas alterações
4. Abra um Pull Request

---

## 🧪 Padrões de Código
- Siga a estrutura SQL definida
- Mantenha organização e clareza nas procedures e triggers
- Utilize nomes descritivos

---

## 🔍 Commits
Siga o padrão:
- `feat:` nova funcionalidade
- `fix:` correção de bug
- `docs:` documentação
- `refactor:` refatoração

Exemplo:
```
feat: adiciona procedure de cancelamento de pedido
```

---

## 🧱 Padrão para Pull Requests
- Descreva o que mudou
- Relacione a issue correspondente
- Valide que os scripts SQL executam sem erros

---

## 🗂 Estrutura recomendada do projeto SQL
```
sql/
  schema.sql
  inserts/
  procedures/
  triggers/
  views/
.github/
  ISSUE_TEMPLATE/
  pull_request_template.md
README.md
CONTRIBUTING.md
```

---

## 💬 Suporte
Abra uma issue se tiver dúvidas.
```

