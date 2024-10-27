def calculadora():
    while True:
        print("\nEscolha uma operação:")
        print("1: Soma")
        print("2: Subtração")
        print("3: Multiplicação")
        print("4: Divisão")
        print("0: Sair")
        
        opcao = input("Digite o número da operação correspondente: ")
        
        if opcao == '0':
            print("Saindo...")
            break
        elif opcao not in ['1', '2', '3', '4']:
            print("Essa opção não existe. Tente novamente.")
            continue
        
        try:
            num1 = float(input("Digite o primeiro número: "))
            num2 = float(input("Digite o segundo número: "))
        except ValueError:
            print("Entrada inválida. Digite números válidos.")
            continue

        if opcao == '1':
            resultado = num1 + num2
            print(f"O resultado da soma é: {resultado}")
        elif opcao == '2':
            resultado = num1 - num2
            print(f"O resultado da subtração é: {resultado}")
        elif opcao == '3':
            resultado = num1 * num2
            print(f"O resultado da multiplicação é: {resultado}")
        elif opcao == '4':
            if num2 == 0:
                print("Erro: divisão por zero não é permitida.")
            else:
                resultado = num1 / num2
                print(f"O resultado da divisão é: {resultado}")

calculadora()
