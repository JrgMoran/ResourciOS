//
//  main.swift
//  ResourciOS
//
//  Created by Jorge Morán on 16/02/2020.
//  Copyright © 2020 Jorge Morán. All rights reserved.
//

import Foundation

let defaultMode: ModeGenerateFile = .attributesClass

let args = Array(CommandLine.arguments.dropFirst())

let folder: String = args.first(where: { $0.first == "/" }).map({ String($0.dropFirst()) }) ?? FileManager.default.currentDirectoryPath

let opcionStr = args.first(where: { ModeGenerateFile(rawValue: $0) != nil } )

let opcion: ModeGenerateFile = opcionStr != nil ? ModeGenerateFile(rawValue: opcionStr!) ?? defaultMode : defaultMode

let _ = GenerateFiles(from: String(folder), opcion: opcion)

if CommandLine.arguments.count > 3 {
    Info.printInfo()
}


