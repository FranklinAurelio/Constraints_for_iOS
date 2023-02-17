//
//  AnimationCustom.swift
//  AluraViagens
//
//  Created by Franklin Carvalho on 17/02/23.
//

import UIKit

class AnimationCustom: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    // MARK: - Atributos
    private var duration: TimeInterval
    private var image:UIImage
    private var initialFrame: CGRect
    
    // MARK: - Initializer
    init(duration: TimeInterval, image:UIImage, initialFrame:CGRect) {
        self.duration = duration
        self.image = image
        self.initialFrame = initialFrame
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let viewFinal = transitionContext.view(forKey: .to) else {return}
        let imagemTravel = viewFinal.viewWithTag(1) as? UIImageView
        imagemTravel?.image = image
        
        let transitionImage =  UIImageView(frame: initialFrame)
        transitionImage.image = image
        
        let contexto = transitionContext.containerView
        contexto.addSubview(transitionImage)
    }
}
