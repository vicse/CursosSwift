//
//  CursoCompletadoViewController.swift
//  Cursos
//
//  Created by vicse on 12/04/19.
//  Copyright © 2019 tecsup. All rights reserved.
//

import UIKit

class CursoCompletadoViewController: UIViewController {
    
    var curso : Curso? = nil
    //var anteriorVC = ViewController()
    
    @IBOutlet weak var cursoLabel: UILabel!
    @IBOutlet weak var promPracLabel: UILabel!
    @IBOutlet weak var promLabsLabel: UILabel!
    @IBOutlet weak var examenFinalLabel: UILabel!
    @IBOutlet weak var promFinalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if curso!.importante{
            cursoLabel.text = "👿\(curso!.nombre!)"
        } else{
            cursoLabel.text = curso!.nombre!
        }
        
        promPracLabel.text = String(curso!.promPracticas)
        promLabsLabel.text = String(curso!.promLaboratorios)
        examenFinalLabel.text = String(curso!.examenFinal)
        
        let promFinal = (curso!.promPracticas+curso!.promLaboratorios+curso!.examenFinal)/3
        
        promFinalLabel.text = String(promFinal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completarCurso(_ sender: Any){
        //anteriorVC.cursos.remove(at: anteriorVC.indexSeleccionado)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(curso!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
}
