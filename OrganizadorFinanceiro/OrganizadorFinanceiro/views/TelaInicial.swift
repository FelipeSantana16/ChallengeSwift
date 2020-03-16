//
//  TelaInicial.swift
//  OrganizadorFinanceiro
//
//  Created by Tales Conrado on 11/03/20.
//  Copyright © 2020 Tales & Felipe. All rights reserved.
//

import Foundation

class TelaInicial{
    //Classe com funcoes de interacao inicial com o usuario
    
    let controlador:UsuarioController
    
    init(controlador:UsuarioController){
        self.controlador = controlador
    }
    
    func boasVindas(){
        print("Seja bem-vindo ao seu Organizador Financeiro!\n")
        print("Uma aplicação que vai revolucionar a forma como você gerencia o seu dinheiro! Adicione gastos, confira seu saldo diário, acompanhe suas economias, tudo no seu T E R M I N A L.\n")
        print("Pressione enter para continuar...")
        _ = readLine()
        menu()
    }
    
    func menu(opcao: Int = 0){
        
        
        let escolha:String?
        if(opcao == 0){
            print("Selecione uma das opções digitando seu número e pressionando enter.\n")
            print("1 - Entrar\n2 - Criar usuário\n3 - Gerenciar usuário\n4 - Sair")
            escolha = readLine(strippingNewline: true)
        } else {
            escolha = String(opcao)
        }
        switch escolha{
        case "1":
            print("Selecione um dos usuarios digitando o seu ID\n")
            mostrarUsuarios()
            if(controlador.usuarios.count == 0){
                print("Ainda não existem usuários cadastrados")
            }
            print("s - Sair\n")
            let usuarioEscolhidoStr = readLine(strippingNewline: true)
            if(usuarioEscolhidoStr == "s"){
                menu()
                return
            }
            if let usuarioEscolhido = usuarioEscolhidoStr, let escolha = Int(usuarioEscolhido), escolha <= controlador.usuarios.count - 1 && escolha >= 0{
                print("Usuário escolhido:", controlador.usuarios[escolha].nome)
                controlador.logarUsuario(index: escolha)
                let telaUsuario = TelaUsuario(id:escolha, telaInicialController:controlador)
                telaUsuario.mostrarDados()
            } else {
                print("Valor inválido!")
                menu(opcao: 1)
                return
            }
            
            
        case "2":
            var dados = receberDados()
            while !dados.0{
                dados = receberDados()
            }
            
            let id = controlador.criarUsuario(nome: dados.1, salario: dados.2)
            controlador.logarUsuario(index: id)
            let telaUsuario = TelaUsuario(id:id, telaInicialController:controlador)
            telaUsuario.mostrarDados()
            
        case "3":
            
            print("Selecione um dos usuarios para deletar digitando o seu ID\n")
            mostrarUsuarios()
            let usuarioEscolhidoStr = readLine(strippingNewline: true)
            if let usuarioEscolhido = usuarioEscolhidoStr, let escolha = Int(usuarioEscolhido), escolha <= controlador.usuarios.count - 1 && escolha >= 0{
                controlador.usuarios.remove(at: escolha)
            } else {
                print("Escolha inválida")
                menu(opcao:3)
                return
            }
            
            
        default:
            print("Escolha inválida.")
            return
        }
        
    }
    
    func mostrarUsuarios(){
        
        let listaUsuarios = controlador.listarUsuarios()
        var contador = 0
        for usuario in listaUsuarios{
            print(contador, usuario.nome)
            contador += 1
        }
    }
    
    func receberDados()-> (Bool, String, Double){
        //retornar booleano e loop
        
        print("Precisamos de algumas informações suas para começar.\n")
        print("Primeiro, digite o seu nome:")
        let nomeString = readLine(strippingNewline: true)
        
        guard let nome = nomeString, nome != "" else{
            print("Nome inválido.\n\n\n")
            return (false, "", 0.0)
        }
        
        print("Agora digite o seu salario:")
        let salarioString = readLine(strippingNewline: true)
        
        guard let salario = salarioString, let salarioDouble = Double(salario), salarioDouble > 0
            else{
            print("Salario inválido.\n\n\n")
            return (false, "", 0.0)
        }
        
        return (true, nome, salarioDouble)
        
        }
    
}
