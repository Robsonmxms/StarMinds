//
//  CatTalksView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 06/09/22.
//

import UIKit

class CatTalksView: UIView {

    private var isTalking = false
    private var catImage = UIImageView()
    private var catLabel = UILabel()
    private var catPhrases = CatPhasesModel.loadJson()


    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTalking.toggle()
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CatTalksView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(catImage)
        if isTalking {self.addSubview(catLabel)}

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            catImage.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),
            catImage.heightAnchor.constraint(
                equalTo: self.heightAnchor
            ),
            catImage.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.7
            )
        ])

        if isTalking {activeLabelIfIsTalking()}

    }

    func configureViews() {

        catImage.image = UIImage(
            named: isTalking ? "CatSmallEyes.png" : "CatBigEyes.png"
        )
        catImage.contentMode = .scaleAspectFit
        catImage.translatesAutoresizingMaskIntoConstraints = false

        
        guard let phrase = catPhrases?.randomElement()?.text else {
            fatalError("Could't load phrase")
        }
        catLabel.text = isTalking ? phrase : ""
        catLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.04,
            weight: .bold
        )
        catLabel.textColor = .black
        catLabel.numberOfLines = 3
        catLabel.lineBreakMode = .byWordWrapping
        catLabel.textAlignment = .center
        catLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func activeLabelIfIsTalking() {
            catLabel.centerXAnchor.constraint(
                equalTo: catImage.centerXAnchor,
                constant: ScreenSize.width*0.09
            ).isActive = true
            catLabel.centerYAnchor.constraint(
                equalTo: catImage.centerYAnchor,
                constant: -ScreenSize.height*0.055
            ).isActive = true
            catLabel.widthAnchor.constraint(
                equalTo: catImage.widthAnchor,
                multiplier: 0.34
            ).isActive = true
            catLabel.heightAnchor.constraint(
                equalTo: catImage.heightAnchor,
                multiplier: 0.4
            ).isActive = true
    }

}
