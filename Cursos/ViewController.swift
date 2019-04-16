//  Cursos
//  Created by vicse on 12/04/19.
//  Copyright © 2019 tecsup. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //var indexSeleccionado: Int = 0
    
    // arreglo de cursos
    var cursos: [Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //llenando el  arrray con la funcion de crearCursos
        //cursos = crearCursos()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let curso = cursos[indexPath.row]
        
        if editingStyle == .delete {
            print("Delete")
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            //navigationController!.popViewController(animated: true)
            
            obtenerCursos()
            tableView.reloadData()
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        
        if curso.importante{
            cell.textLabel?.text = "😍\(curso.nombre!)"
        } else{
            cell.textLabel?.text = curso.nombre!
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let curso = cursos[indexPath.row]
        
        if (curso.promLaboratorios+curso.examenFinal+curso.promPracticas)/3 >= 13{
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.red
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indexSeleccionado = indexPath.row
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionadoSegue", sender: curso)
    }
    
    @IBAction func agregarCurso(_ sender: Any){
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        } catch {
            print("Ah corrido un error")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cursoSeleccionadoSegue"{
            let siguienteVC = segue.destination as! CursoCompletadoViewController
            siguienteVC.curso = sender as! Curso
            //siguienteVC.anteriorVC = self
            
        }
        
        
    }

}

