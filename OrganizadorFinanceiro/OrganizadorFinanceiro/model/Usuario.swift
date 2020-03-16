//
//  Usuario.swift
//  OrganizadorFinanceiro
//
//  Created by Tales Conrado on 11/03/20.
//  Copyright © 2020 Tales & Felipe. All rights reserved.
//

import Foundation


class Usuario{
    //Definem-se os valores iniciais, atributos e a inicializacao
    
    let nome:String
    let salario:Double
    var valorDisponivelDiario:Double = 0.0
    var valorGastoMensal:Double = 0.0
    var diasPassados:Int = 0
    let valorDiarioInicial:Double
    
    init(nome:String, salario:Double) {
        
        self.nome = nome
        self.salario = salario
        //valorDiarioInicial feito sem considerar gastos fixos
        valorDiarioInicial = salario / 30
    }
    
    func calculaDisponivelDiario()->Double{
        //Funcao para calcular o gasto diario disponivel, de acordo com o salario
        valorDisponivelDiario = (salario - valorGastoMensal)/30
        
        return valorDisponivelDiario
    }
    
    
    
}
