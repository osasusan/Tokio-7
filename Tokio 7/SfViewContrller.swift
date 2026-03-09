    //
    //  SfViewContrller.swift
    //  Tokio 7
    //
    //  Created by Osasu sanchez on 9/3/26.
    //

import UIKit
import SafariServices
import MessageUI

class SfViewContrller: UIViewController,MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func obtenerHTML() -> String {
        if let ruta = Bundle.main.path(forResource: "emailPantalla", ofType: "html"),
           let contenido = try? String(contentsOfFile: ruta, encoding: .utf8) {
            return contenido
        }
        return "<h1>Error: Archivo no encontrado</h1>"
    }
    
        //p2
    @IBAction func navegarPregunta2(_ sender: Any) {
        let safariVC = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true)
    }
    
        //p3
    @IBAction func navegarPregunta3(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["osaussan@gmail.com"])
            mail.setSubject("Email desde archivo HTML")
            
                // Usamos el HTML del archivo externo
            mail.setMessageBody(obtenerHTML(), isHTML: true)
            mail.modalPresentationStyle = .fullScreen
            present(mail, animated: true)
        } else {
            print("Error: Configura el mail en un iPhone real")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewController {
            
            if segue.identifier == "verWeb" {
                    // Caso Pregunta 1: Cargar Apple
                destino.ver = 0
                
            } else if segue.identifier == "verPlantilla" {
                    // Caso Pregunta 3: Cargar HTML del archivo
                destino.ver = 1
            }
        }
    }
}
