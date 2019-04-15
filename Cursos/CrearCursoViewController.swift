//
//  CrearCursoViewController.swift
//  Cursos
//
//  Created by vicse on 12/04/19.
//  Copyright © 2019 tecsup. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    @IBOutlet weak var txtPromPractica: UITextField!
    @IBOutlet weak var txtPromLaboratorio: UITextField!
    @IBOutlet weak var txtExamenFinal: UITextField!
    
    //var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregar(_ sender: Any){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Curso(context: context)
        curso.nombre = txtNombre.text!
        curso.importante = swImportante.isOn
        curso.promPracticas = Int16(txtPromPractica.text!)!
        curso.promLaboratorios = Int16(txtPromLaboratorio.text!)!
        curso.examenFinal = Int16(txtExamenFinal.text!)!
        
        //añadir al array
        //anteriorVC.cursos.append(curso)
        
        //recargar el array
        //anteriorVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
}
