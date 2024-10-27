def obter_informacoes_usuario():
    while True:
        nome = input("Digite seu nome completo: ")
        if nome.strip():  
            break
        else:
            print("O nome não pode estar vazio. Tente novamente.")

    while True:
        try:
            ano_nascimento = int(input("Digite o ano de nascimento (entre 1922 e 2021): "))
            
            if 1922 <= ano_nascimento <= 2021:
                break
            else:
                print("Ano de nascimento deve estar entre 1922 e 2021. Tente novamente.")
        except ValueError:
            print("Erro: Digite um número válido para o ano de nascimento.")

    idade = 2022 - ano_nascimento
    
    print(f"\nNome do usuário: {nome}")
    print(f"Idade em 2022: {idade} anos")

obter_informacoes_usuario()
