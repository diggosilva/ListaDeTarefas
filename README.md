# ListaDeTarefas (To-Do List)

Um aplicativo iOS moderno para gerenciamento de tarefas diárias, focado em organização por prioridades e uma experiência de usuário fluida.

## ✨ Funcionalidades

- **Adicionar Tarefas**: Crie tarefas com título e níveis de prioridade.
- **Priorização**: As tarefas são visualmente identificadas por cores baseadas na urgência.
- **Ordenação Inteligente**: 
    - Tarefas pendentes aparecem no topo.
    - Ordenação secundária por nível de prioridade.
    - Tarefas concluídas são movidas para o fim da lista com opacidade reduzida.
- **Persistência de Dados**: Seus dados são salvos localmente, garantindo que nada se perca ao fechar o app.
- **Animações Modernas**: Utiliza **SF Symbols 5** com efeitos de `drawOn` e `drawOff` ao marcar tarefas como concluídas.

## 🛠 Tecnologias e Frameworks

- **Linguagem**: [Swift 5.10+](https://swift.org)
- **Interface**: [UIKit](https://developer.apple.com/documentation/uikit) (Programmatic UI)
- **Arquitetura**: MVVM (Model-View-ViewModel)
- **Persistência**: Repository Pattern (UserDefaults/JSON)
- **Animações**: Symbol Framework (iOS 17+)
- **Listas**: `UITableView` com `DiffableDataSource` para transições suaves.

## 🏗 Arquitetura

O projeto segue o padrão **MVVM**, garantindo separação de responsabilidades e facilitando a escrita de testes unitários:

- **Model**: `Tarefa.swift` define a estrutura do dado.
- **View**: `TaskCell.swift` gerencia a exibição e animações da célula. `TaskListViewController` gerencia a lista.
- **ViewModel**: `TaskListViewModel.swift` contém toda a lógica de ordenação, filtragem e comunicação com o repositório.
- **Repository**: Camada responsável por abstrair a lógica de salvamento e carregamento de dados.

## 🚀 Como Executar o Projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/diggosilva/ListaDeTarefas.git

2. Após a clonagem, faça o seguinte:
    ```bash
    $ cd <diretorio-base>/ListaDeTarefas/
    $ open ListaDeTarefas.xcodeproj/
