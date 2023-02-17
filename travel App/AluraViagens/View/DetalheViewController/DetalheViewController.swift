//
//  DetalheViewController.swift
//  AluraViagens
//
//  Created by Franklin Carvalho on 26/01/23.
//

import UIKit

class DetalheViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viagemImage: UIImageView!
    
    @IBOutlet weak var tituloViagemLabel: UILabel!
    
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    @IBOutlet weak var diariaViagemLabel: UILabel!
  
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    // MARK: - Atributos
    
    var viagem: Viagem?
    
    // MARK: - View Life Cycle
    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController{
        let detalheViewController = DetalheViewController (nibName: String(describing: self), bundle: nil)
        detalheViewController.viagem = viagem
        
        return detalheViewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView(){
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
        
    }
    // MARK: - Actions


    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func shakeAnimation(_ object:UIButton){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        let initialPosition = CGPoint(x:object.center.x + 5 , y: object.center.y)
        let finalPosition = CGPoint(x:object.center.x - 5 , y: object.center.y)
        shake.fromValue = initialPosition
        shake.toValue = finalPosition
        object.layer.add(shake, forKey: nil)
    }
    
    func pulseAnimation(_ object:UIButton){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        object.layer.add(pulse, forKey: nil)
        
    }
    
    func animateButton(_ objectAnimated:UIButton) {
        if(viagem?.titulo == "Pacote Natal" ||
           viagem?.titulo == "Beto Carrero" ||
           viagem?.titulo == "São Luís" ){
            
            pulseAnimation(objectAnimated)
            
            //navigationController?.popViewController(animated: true)

        }
        else{
            shakeAnimation(objectAnimated)
        }
    }
    
    
    @IBAction func botaoContinuar(_ sender: UIButton)  {
        //guard let controller = //self.storyboard?.instantiateViewController(withIdentifier: //"botaoContinuar") else { return }
        animateButton(sender)
        
    }
    
}
