//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Virgilio De la Cruz on 2/14/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("error Core Data Store \(error.localizedDescription)")
            }
        }
    }
    
    func updateMovie() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    func deleteMovie(movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Error al guardar context \(error)")
        }
        
    }
    
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return [] 
        }
        
    }
    
    func saveMovie(title: String, duracion:String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        movie.duracion = duracion
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error al guardar pelicula \(error)")
        }
        
    }
    func updatePelicula() {
           
           do {
               try persistentContainer.viewContext.save()
           } catch {
               persistentContainer.viewContext.rollback()
           }
           
       }
       
       func deletePelicula(Pelicula: Pelicula) {
           
           persistentContainer.viewContext.delete(Pelicula)
           
           do {
               try persistentContainer.viewContext.save()
           } catch {
               persistentContainer.viewContext.rollback()
               print("Error al guardar context \(error)")
           }
           
       }
       
       func getAllPeliculas() -> [Pelicula] {
           
           let fetchRequest: NSFetchRequest<Pelicula> = Pelicula.fetchRequest()
           
           do {
               return try persistentContainer.viewContext.fetch(fetchRequest)
           } catch {
               return []
           }
           
       }
       
    func savePelicula(titulo: String, duracion: String) {
           
           let Pelicula = Pelicula(context: persistentContainer.viewContext)
           Pelicula.titulo = titulo
           Pelicula.duracion = duracion
           
           do {
               try persistentContainer.viewContext.save()
           } catch {
               print("Error al guardar pelicula \(error)")
           }
           
       }
    
}
