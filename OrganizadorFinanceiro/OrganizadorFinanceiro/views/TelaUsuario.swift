//
//  TelaUsuario.swift
//  OrganizadorFinanceiro
//
//  Created by Tales Conrado on 11/03/20.
//  Copyright © 2020 Tales & Felipe. All rights reserved.
//

import Foundation

class TelaUsuario{
    
    var idUsuario:Int
    let controlador:UsuarioController
    let nome:String
    let gastos:Double
    let salario:Double
    var diario:Double
    
    init(id:Int, telaInicialController:UsuarioController){
        idUsuario = id
        controlador = telaInicialController
        nome = controlador.usuarios[idUsuario].nome
        gastos = controlador.usuarios[idUsuario].valorGastoMensal
        salario = controlador.usuarios[idUsuario].salario
        diario = controlador.usuarios[idUsuario].valorDisponivelDiario
    }
    
    func mostrarDados(){
        print("\n\n\nUsuário:", nome)
        print("")
        print("Valor disponivel diário: R$", Double(round(diario*100)/100))
        print("\n")
        opcoesUsuario()
    }
    
    func opcoesUsuario(){
        
        print("1 - Adicionar um novo gasto.\n2 - Passar um dia.\n\n0 - Voltar.")
        let escolha = readLine(strippingNewline: true)
        guard let escolhaAux = escolha else{
            fatalError()
        }
        guard let escolhaInt = Int(escolhaAux) else {
            fatalError()
        }
        
        if escolhaInt < 3 && escolhaInt > -1{
            switch escolhaInt{
            case 0:
                let telaInicial = TelaInicial(controlador:controlador)
                telaInicial.menu()
            case 1:
                adicionarGasto()
            case 2:
                passarDia()
            default:
                print("default")
            }
        }
    }
    
    func adicionarGasto(){
        print("Digite o seu gasto, separando os decimais por ponto (.) e em seguida pressione enter.\n")
        let novoGasto = readLine(strippingNewline: true)
        if let gasto = novoGasto, let gastoDouble = Double(gasto), gastoDouble > 0{
            diario -= gastoDouble
            controlador.usuarios[idUsuario].valorDisponivelDiario -= gastoDouble
        }
        mostrarDados()
    }
    
    func passarDia(){
        
        diario = diario + controlador.usuarios[idUsuario].valorDiarioInicial
        controlador.usuarios[idUsuario].valorDisponivelDiario += controlador.usuarios[idUsuario].valorDiarioInicial
        mostrarDados()
        
    }
    
}
