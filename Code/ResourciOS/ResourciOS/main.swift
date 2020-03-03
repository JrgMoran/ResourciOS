//
//  main.swift
//  ResourciOS
//
//  Created by Jorge Morán on 16/02/2020.
//  Copyright © 2020 Jorge Morán. All rights reserved.
//

import Foundation

let defaultMode: ModeGenerateFile = .attributesStruct

if(CommandLine.arguments.count == 2){
    if let opcion = ModeGenerateFile.stringToModeGenerateFile(str: CommandLine.arguments.last!) {
       let _ = GenerateFiles(from: FileManager.default.currentDirectoryPath, opcion: opcion)
    } else {
        let _ = GenerateFiles(from: CommandLine.arguments.last!, opcion: defaultMode)
    }
    
} else if(CommandLine.arguments.count == 3){
    let _ = GenerateFiles(from: CommandLine.arguments[1], opcion: ModeGenerateFile.stringToModeGenerateFile(str: CommandLine.arguments.last!) ?? defaultMode)
} else if(CommandLine.arguments.count == 1) {
    
    let _ = GenerateFiles(from: FileManager.default.currentDirectoryPath, opcion: defaultMode)

} else{
    Info.printInfo()
}


