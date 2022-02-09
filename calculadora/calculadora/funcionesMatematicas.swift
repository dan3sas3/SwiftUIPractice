//
//  funcionesMatematicas.swift
//  calculadora
//
//  Created by alumno on 08/02/22.
//

import Foundation

func suma(x:String?, y:String?) -> String{
    var myx: Float = 0
    var myy: Float = 0
    
    if !(x!.isEmpty){
        if let t = x{
            myx = Float(t)!
        }
    }
    if !(y!.isEmpty){
        if let t = y{
            myy = Float(t)!
        }
    }
    let suma = myx + myy
    let salida = String(format: "La suma es %.2f",suma)
    
    return salida
}
func resta(x:String?, y:String?) -> String{
    var myx: Float = 0
    var myy: Float = 0
    
    if !(x!.isEmpty){
        if let t = x{
            myx = Float(t)!
        }
    }
    if !(y!.isEmpty){
        if let t = y{
            myy = Float(t)!
        }
    }
    let resta = myx - myy
    let salida = String(format: "La resta es %.2f", resta)
    
    return salida
}
