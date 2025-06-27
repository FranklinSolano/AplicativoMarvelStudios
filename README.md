# 🔥 Marvel Heroes App

Aplicativo iOS desenvolvido com base na arquitetura VIP (View, Interactor, Presenter), utilizando Coordinator para gerenciar a navegação e Factory para injeção e organização de dependências. Este projeto é uma prática profissional simulando o fluxo completo de desenvolvimento em equipe, incluindo organização por features, GitFlow para versionamento de codigo e Trello para organizacao 
---

## ✨ Funcionalidades

- 🔎 Lista de personagens da Marvel com busca
- 📄 Tela de detalhes do personagem
- ⭐ Favoritar personagens
- 👤 Tela de perfil com botão de escolha de tema
- 🔐 Login / Registro / Recuperar Senha
- 🌙 Tema claro e escuro persistido via `UserDefaults`
- 💥 Alertas de erro com tratamento de falhas na API
- 🔁 Navegação via `Coordinator`
- 🧰 Camada de `Factory` para linkar os módulos com injeção de dependências

---

## 🧩 Arquitetura Utilizada

O projeto foi totalmente estruturado usando a arquitetura VIP combinada com:

- 🧠 **View**: Responsável por exibir os dados e receber interações do usuário.
- 🦾 **Interactor**: Contém as regras de negócio e lida com os dados vindos da API ou local.
- 🧑‍🏫 **Presenter**: Faz o tratamento de dados entre a Interactor e a View.
- 🧭 **Coordinator**: Responsável por controlar a navegação entre telas de forma modular.
- 🏗️ **Factory**: Cria e injeta as dependências necessárias para montar cada feature.
- 🔧 **Service**: Responsável por chamadas HTTP (API Marvel) e tratamento de erro.

---

## 🚀 Tecnologias e Ferramentas

- 📱 **UIKit**
- 📡 **URLSession** (Networking)
- 💾 **UserDefaults**
-    **CoreData**
- 🧱 **SnapKit** (AutoLayout programático)
- 🎨 **Design System próprio** com componentes reutilizáveis (botões, cores, fontes, labels, etc.)
- 🌙 **Tema escuro/claro** com salvamento da escolha
- 🧪 **@MainActor** e melhorias de thread-safety
- 🧪 **Trello** para organização de tarefas
- 🧪 **Git** com fluxo de branches (main, develop, feature/*)
-    **ViewCode** para construcao do app 
-    **SDWImage** para cache de imagens 
-    **Extension, Protocolos**
-    **Firebase** para banco de dados e autentificacao
- 👨🏻‍💻 **Xcode**

## 🧱 Design System

- `DSButton`, `DSLabel`, `DSTextField` e outros componentes customizados.
- Tipografia e cores definidas em enums centralizados.
- Extensões criadas para reutilização (`UIView+`, `UIColor+`, `UIImage+`, etc.)

---

## 🔧 Como rodar o projeto

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/MarvelApp.git
```

2. Abra o projeto no Xcode:
```bash
open MarvelApp.xcodeproj
```

3. Crie o arquivo `Keys.plist` na raiz do projeto e adicione sua `marvelPublicKey` e `marvelPrivateKey`:
```xml
<plist version="1.0">
<dict>
    <key>marvelPublicKey</key>
    <string>SUA_CHAVE_PUBLICA</string>
    <key>marvelPrivateKey</key>
    <string>SUA_CHAVE_PRIVADA</string>
</dict>
</plist>
```

4. Rode o projeto no simulador ou em um dispositivo real.

---

## ✅ Boas práticas aplicadas

- Responsabilidade única em cada camada
- Modularização por feature
- Separação de responsabilidades (camadas isoladas)
- Uso de `@MainActor` para garantir segurança de thread
- Manutenção facilitada por uso de `Coordinator` e `Factory`
- Controle de tema com persistência
- Organização com Trello e fluxo de Git

---

## 🧠 Próximas melhorias (to-do)

- [ ] Adicionar testes unitários nas camadas Interactor e Service
- [ ] Adicionar acemssibilidade
- [ ] Vincular o firebase na tela favoritos para poder salvar e remover o personagem salvo
- [ ] Vincular o CoreData com o firebase para rodar os favoritos em offline 

---

## 👨🏻‍💻 Autor

**Franklin Solano**  
Estudante dedicado de iOS, focado em se tornar desenvolvedor júnior profissional.  
Conecte-se comigo no [LinkedIn](https://www.linkedin.com/in/franklin-solano-b092b7232/)
