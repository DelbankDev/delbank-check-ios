# ApiService - Serviço validação de transação

## Descrição

O **ApiService** é uma classe que realiza o envio de notificações push para um endpoint AWS API Gateway. Ela utiliza o framework `SwiftJWT` para gerar e assinar um token JWT como parte da autenticação. Além disso, suporta callbacks de sucesso e erro via protocolo `DelcheckViewControllerDelegate`.

---

## Estruturas e Protocolos

### `PushNotificationResponse`
Modelo que representa a resposta recebida ao enviar uma notificação push.

| Propriedade        | Tipo   | Descrição                                      |
|--------------------|--------|------------------------------------------------|
| `authorizationId`  | String | ID de autorização retornado pela API.          |
| `code`             | String | Código associado à resposta.                   |
| `message`          | String | Mensagem descritiva da resposta.               |

### `DelcheckViewControllerDelegate`
Protocolo para manipulação de callbacks de sucesso e erro.

#### Métodos

- `didReceiveSuccess(result: [String: Any])`
  - Chamado quando a requisição é bem-sucedida.
  - **Parâmetro**: `result` - Dicionário contendo os resultados da operação.

- `didReceiveError(error: [String: Any])`
  - Chamado quando ocorre um erro na requisição.
  - **Parâmetro**: `error` - Dicionário contendo os detalhes do erro.

---

## Classe `ApiService`

### Descrição

Classe responsável por gerenciar o envio de notificações push e manipular respostas da API.

### Propriedades

| Nome       | Tipo                               | Descrição                                              |
|------------|------------------------------------|-------------------------------------------------------|
| `delegate` | `DelcheckViewControllerDelegate?`  | Delegate para enviar callbacks de sucesso ou erro.    |

### Métodos

#### `init(delegate: DelcheckViewControllerDelegate? = nil) throws`
Inicializa a instância do `ApiService`.

| Parâmetro | Tipo                               | Descrição                                              |
|-----------|------------------------------------|-------------------------------------------------------|
| `delegate`| `DelcheckViewControllerDelegate?`  | Delegate para manipulação de respostas da API.        |

#### `sendPushNotification(data: SendPushNotification)`
Envia uma notificação push.

| Parâmetro | Tipo                    | Descrição                                              |
|-----------|-------------------------|-------------------------------------------------------|
| `data`    | `SendPushNotification`  | Dados necessários para a notificação push.            |

---

## Fluxo de Operação

1. **Configuração do JWT**:
   - O JWT é criado com as reivindicações necessárias (`iss`, `sub`, `exp` e `sdk`).
   - O arquivo `privateKey.key` é carregado do bundle para assinar o JWT.

2. **Configuração do Request**:
   - Configura o cabeçalho HTTP, incluindo o token JWT no campo `Authorization` e uma chave de API no campo `x-api-key`.
   - O corpo da requisição é serializado em JSON com os dados da notificação.

3. **Execução do Request**:
   - A requisição é enviada para o endpoint especificado.
   - Em caso de sucesso (status HTTP 2xx), o corpo da resposta é decodificado em um objeto `PushNotificationResponse`.
   - Em caso de erro, uma mensagem de erro é enviada para o delegate.

---

## Tratamento de Erros

### Erros Possíveis

| Código  | Descrição                              |
|---------|----------------------------------------|
| `-1`    | URL inválida.                          |
| `500`   | Erro desconhecido na conexão.          |
| `4xx`   | Erros relacionados ao cliente.         |
| `5xx`   | Erros relacionados ao servidor.        |

### Exemplo de Callback de Erro

```swift
let errorResponse: [String : Any] = [
    "codigo": 500,
    "descricao": "Erro desconhecido",
    "id": "ERROR"
]
delegate?.didReceiveError(error: errorResponse)

### Como Buildar o Framework para Uso no Flutter
```
Para compilar o framework e integrá-lo em um projeto Flutter, siga os passos abaixo:

1. **Abra o Projeto no Xcode**: Certifique-se de que o esquema selecionado é o do framework que você deseja compilar.
2. **Configure o Target**: Ajuste o target para "Any iOS Device (arm64)" e selecione o modo de build como **Release**.
3. **Gerar o Archive**: Vá em **Product > Archive** no menu do Xcode para criar o arquivo `.xcframework`.
4. **Exportar o Framework**: Localize o arquivo gerado na pasta de saída do Xcode (normalmente em `~/Library/Developer/Xcode/DerivedData`) e compacte o `.xcframework`.
5. **Adicionar ao Projeto Flutter**: Coloque o arquivo compactado no diretório `ios/Frameworks` do seu projeto Flutter.
6. **Atualizar o Podfile**: Certifique-se de que o framework está referenciado no `Podfile` do projeto Flutter. Em seguida, execute o comando `pod install` para finalizar a configuração.

Após seguir esses passos, o framework estará pronto para ser integrado e utilizado no aplicativo Flutter.

