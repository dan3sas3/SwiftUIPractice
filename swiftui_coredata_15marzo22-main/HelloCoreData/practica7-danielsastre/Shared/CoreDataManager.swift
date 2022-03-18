//
//  CoreDataManager.swift
//  practica7-danielsastre
//
//  Created by alumno on 17/03/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "School")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("error Core Data Store \(error.localizedDescription)")
            }
        }
    }
    
    func update() {
           
           do {
               try persistentContainer.viewContext.save()
           } catch {
               persistentContainer.viewContext.rollback()
           }
           
       }
       
    func getAllAlumnos() -> [Alumnos] {
        let fetchRequest: NSFetchRequest<Alumnos> = Alumnos.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
           
    }
       
    func saveAlumno(id: String, nombre: String, carrera:String) {
        let alumno = Alumnos(context: persistentContainer.viewContext)
        alumno.id = id
        alumno.nombre = nombre
        alumno.carrera = carrera
           
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error al guardar alumno \(error)")
        }
           
    }
    
    func deleteAlumno(alumno: Alumnos) {
            
            persistentContainer.viewContext.delete(alumno)
            
            do {
                try persistentContainer.viewContext.save()
            } catch {
                persistentContainer.viewContext.rollback()
                print("Error al guardar context \(error)")
            }
            
        }
       
    func getAllProfesores() -> [Profesores] {
        let fetchRequest: NSFetchRequest<Profesores> = Profesores.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
           
    }
       
    func saveProfesor(id: String, nombre: String, descripcion:String) {
        let profesor = Profesores(context: persistentContainer.viewContext)
        profesor.id = id
        profesor.nombre = nombre
        profesor.descripcion = descripcion
           
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error al guardar profesor \(error)")
        }
           
    }
    
    func deleteProfesor(profesor: Profesores) {
            
            persistentContainer.viewContext.delete(profesor)
            
            do {
                try persistentContainer.viewContext.save()
            } catch {
                persistentContainer.viewContext.rollback()
                print("Error al guardar context \(error)")
            }
            
        }
}
