//
//  AddParallax.swift
//  StarMinds
//
//  Created by Samantha Eufrásio Rocha on 13/09/22.
//

import UIKit
import AVFoundation

extension UIView {
    func addParallax(_ amount: Int) {

        let horizontal = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: .tiltAlongHorizontalAxis
        )

        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount

        let vertical = UIInterpolatingMotionEffect(
            keyPath: "center.y",
            type: .tiltAlongVerticalAxis
        )

        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount

        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        self.addMotionEffect(group)
    }

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
         )
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

//    var players: [URL:AVAudioPlayer]
//    var duplicatePlayers: [AVAudioPlayer]

    func playSound(
        soundName: String,
        playersArray: [URL:AVAudioPlayer],
        duplicatePlayersArray: [AVAudioPlayer]
    ) {
        var players = playersArray
        var duplicatePlayers = duplicatePlayersArray
            guard let soundUrl = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
            else {
                return
            }

            if let player = players[soundUrl] {
                if !player.isPlaying {
                    player.prepareToPlay()
                    player.play()
                    return
                }
                createADuplicatedPlayer()
                return
            }

            createANewPlayer()

            func createANewPlayer() {
                do{
                    let player = try AVAudioPlayer(contentsOf: soundUrl)
                    players[soundUrl] = player
                    player.prepareToPlay()
                    player.play()
                } catch {
                    print("Could not play sound file!")
                }
            }

            func createADuplicatedPlayer() {
                let newPlayer = try! AVAudioPlayer(contentsOf: soundUrl)
                duplicatePlayers.append(newPlayer)
                newPlayer.prepareToPlay()
                newPlayer.play()
            }

        }

    private func playMutipleSounds(soundFileNames: [String]) {
        for soundName in soundFileNames {
            playSound(soundName: soundName)
        }
    }

    private func playMutipleSounds(soundFileNames: [String], withDelay: Int) {
        DispatchQueue.global(qos: .default).async {
            for soundName in soundFileNames {
                  DispatchQueue.main.async {
                      self.playSound(soundName: soundName)
                  }

                usleep(useconds_t(1000000 / withDelay))
              }
         }
    }

}
