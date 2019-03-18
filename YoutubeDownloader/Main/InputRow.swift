//
//  InputRow.swift
//  YoutubeDownloader
//
//  Created by khoa on 18/03/2019.
//  Copyright © 2019 Fantageek. All rights reserved.
//

import AppKit

final class InputRow: NSView {
  let numberLabel = Label()
  let contentView = NSView()
  let inputTextField = NSTextField()
  let button = NSButton(image: NSImage(named: NSImage.Name("download"))!, target: nil, action: nil)

  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    
    setupBackground()
    button.isBordered = false
    
    addSubview(contentView)
    addSubview(button)
    addSubview(numberLabel)
    
    numberLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    button.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      numberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
      
      contentView.leftAnchor.constraint(equalTo: numberLabel.rightAnchor, constant: 8),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
      contentView.rightAnchor.constraint(equalTo: button.leftAnchor),
      
      button.rightAnchor.constraint(equalTo: rightAnchor),
      button.centerYAnchor.constraint(equalTo: centerYAnchor),
      button.heightAnchor.constraint(equalToConstant: 30)
    ])
    
    toInputMode()
  }
  
  required init?(coder decoder: NSCoder) {
    fatalError()
  }
  
  private func setupBackground() {
    let box = NSBox()
    
    box.boxType = .custom
    box.alphaValue = 0.2
    box.borderColor = NSColor.orange
    box.borderType = .grooveBorder
    box.borderWidth = 1
    box.cornerRadius = 10
    box.fillColor = NSColor.orange
    
    addSubview(box)
    box.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      box.leftAnchor.constraint(equalTo: leftAnchor),
      box.rightAnchor.constraint(equalTo: rightAnchor),
      box.topAnchor.constraint(equalTo: topAnchor),
      box.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func toInputMode()  {
    contentView.addSubview(inputTextField)
    inputTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      inputTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      inputTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      inputTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    button.target = self
    button.action = #selector(onDownloadPress)
  }
  
  @objc func onDownloadPress() {
    toDownloadMode()
  }
  
  @objc func onClosePress() {
    
  }
  
  private func toDownloadMode() {
    inputTextField.removeFromSuperview()
    button.image = NSImage(named: NSImage.Name("delete"))!
    button.action = #selector(onClosePress)
    
  }
}