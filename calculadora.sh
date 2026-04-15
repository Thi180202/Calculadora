#!/bin/bash

#!/bin/bash

clear

while true
do
    echo "==============================="
    echo "      CALCULADORA BASH"
    echo "==============================="
    echo "1) Soma"
    echo "2) Subtração"
    echo "3) Multiplicação"
    echo "4) Divisão"
    echo "5) Potência"
    echo "6) Sair"
    echo "==============================="

    read -p "Escolha uma opção: " opcao

    if [[ "$opcao" == "6" ]]; then
        echo "Saindo..."
        break
    fi

    # Validação da opção
    if ! [[ "$opcao" =~ ^[1-6]$ ]]; then
        echo "Opção inválida!"
        sleep 1
        clear
        continue
    fi

    read -p "Digite o primeiro número: " num1
    read -p "Digite o segundo número: " num2

    # Validação de número (aceita inteiro e decimal com ponto)
    if ! [[ "$num1" =~ ^-?[0-9]+([.][0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Entrada inválida! Digite números válidos."
        sleep 2
        clear
        continue
    fi

    case $opcao in
        1)
            resultado=$(echo "$num1 + $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        2)
            resultado=$(echo "$num1 - $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        3)
            resultado=$(echo "$num1 * $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        4)
            if [[ "$num2" == "0" ]]; then
                echo "Erro: divisão por zero!"
            else
                resultado=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Resultado: $resultado"
            fi
            ;;
        5)
            resultado=$(echo "$num1 ^ $num2" | bc)
            echo "Resultado: $resultado"
            ;;
    esac

    echo ""
    read -p "Pressione Enter para continuar..."
    clear
done
