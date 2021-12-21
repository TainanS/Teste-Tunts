#language: pt

Funcionalidade: Cadastro de Usuário
    Sendo que visito um site e quero fazer meu cadastro
    
    @Sucesso
    Cenário: Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | nome          | Leandro              |
            | email         | leandro888@email.com |
            | senha         | l$88                 |
            | repetir senha | l$88                 |
        E seleciono a opção "cadastro"
        Então devo ver a mensagem "Cadastro realizado com sucesso!"

    @Falha
    Cenário: Tentativa de cadastro nome, email ou senha inválidos
        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com: <nome>, <email>, <senha>, <repetir senha>
        Então devo ver a mensagem: "<mensagem_saída>"

        Exemplos:
            | nome        | email                   | senha  | repetir senha | mensagem_saída                                                                                                     |
            | "Leandro"   | "leandro888@ggmail.com" | "l$88" | "l$88"        | Este e-mail é inválido.                                                                                            |
            | "Leandro"   | "leandro888@email.com"  | "l88"  | "l88"         | Lembre-se que deverá ser informado no mínimo 4 caracteres (Ao menos uma letra, um caractere especial e um número). |
            | "Leandro81" | "leandro888@email.com"  | "l$88" | "l$88"        | Nome de usuário inválido.                                                                                          |
            | "Leandro"   | "leandro888@email.com"  | "l$88" | "lG88"        | Senhas não são iguais.                                                                                             |

    @Repeat
    Cenário: Email ja cadastrado
        Dado que acesso a página de cadastro
        Quando submeto o meu cadastro com:
            | nome  | Leandro              |
            | email | leandro888@email.com |
        Então devo ver a mensagem "Usuário já cadastrado!"

