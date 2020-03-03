//
//  GenerateFiles.swift
//  ResourciOS
//
//  Created by Jorge Morán on 16/02/2020.
//  Copyright © 2020 Jorge Morán. All rights reserved.
//

import Foundation

class GenerateFiles {
    private let reservedWords = ["class", "break", "as", "associativity",
                               "deinit", "case", "dynamicType", "convenience",
                               "enum", "continue", "false", "dynamic",
                               "extension", "default", "is", "didSet",
                               "do", "nil", "final", "func",
                               "import", "else","self", "get",
                               "init", "fallthrough", "Self", "infix",
                               "internal", "for", "super", "inout",
                               "let", "if", "true", "lazy",
                               "operator", "in", "__COLUMN__", "left",
                               "private", "return", "__FILE__", "mutating",
                               "protocol", "switch", "__FUNCTION__", "none",
                               "public", "where", "__LINE__", "nonmutating",
                               "static", "while", "optional", "Protocol",
                               "struct", "override", "subscript", "postfix",
                               "typealias", "precedence", "var", "prefix",
                               "required", "right", "set", "Type", "unowned", "weak"]
    
    
    let path: String
    var pathToSave: String {
        get {
            return "\(self.path)\(self.path.last == "/" ? "":"/")\(appName)/Resourcing/"
        }
    }
    var stringsPaths: Array<String> = Array()
    var stringKeyCommited: Array<String> = Array()
    
    var assetsPaths: Array<String> = Array()
    var assetsKeyCommited: Array<String> = Array()
    
    var xcodeprojPath: String? = nil
    var appName:String = ""
    var mode:ModeGenerateFile
    
    var textGenerated: String = ""
    var imagesGenerated: String = ""
    
    init(from path: String, opcion:ModeGenerateFile) {
        self.path = path
        self.mode = opcion
        findFiles(from: path)
        
        stringsPaths.forEach({generateString(ofPath: $0)})
        textGenerated = String(format: "\(self.mode.textHeader)", textGenerated)
        
        assetsPaths.forEach({generateAssets(ofPath: $0)})
        imagesGenerated = String(format: "\(self.mode.imageHeader)", imagesGenerated)
        
        generateFile()
    }
    
    // MARK: FINDS FILES
    
    private func findFiles(from path: String){
        let fileManager = FileManager.default
        do {
            let paths = try fileManager.contentsOfDirectory(atPath: path)
            pathManager(paths, superPath: path)
            
        } catch { }
    }
    
    private func pathManager(_ paths: Array<String>, superPath: String){
        paths.forEach { (thisPath) in
            let pathComplete = "\(superPath)/\(thisPath)"
            let file = thisPath.split(separator: ".")
            if let last = file.last {
                let ext = String(last)
                if ext == "pbxproj" {
                    xcodeprojPath = pathComplete
                } else if ext == "strings" {
                    stringsPaths.append(pathComplete)
                } else if ext == "imageset" {
                    assetsPaths.append(pathComplete)
                } else {
                    if ext == "xcodeproj" { appName = String(file.first!) }
                    findFiles(from: pathComplete)
                    
                }
            }
        }
    }
    
    // MARK: GENERATE FIlES
    
    private func generateString(ofPath: String){
        let dict = NSDictionary(contentsOfFile: ofPath)
        guard let dictWrapped = dict, let keys:[String] = dictWrapped.allKeys as? [String] else { return }
        keys.forEach { (key) in
            if !stringKeyCommited.contains(key) {
                textGenerated += buildWith(key: key, format: mode.textBody)
                stringKeyCommited.append(key)
            }
        }
    }
    
    private func generateAssets(ofPath: String){
        guard let key = ofPath.split(separator: "/").last?.split(separator: ".").first else { return }
        
        if !assetsKeyCommited.contains(String(key)) {
            imagesGenerated += buildWith(key: String(key), format: mode.imageBody)
            assetsKeyCommited.append(String(key))
        }
    }
    
    private func buildWith(key: String, format: String)-> String {
        var newKey = key.replacingOccurrences(of: ".", with: "_", options: .literal, range: nil)
        newKey = newKey.replacingOccurrences(of: "-", with: "_", options: .literal, range: nil)
        newKey = newKey.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        if reservedWords.contains(newKey) { newKey = "`\(newKey)`"}
        return String(format: format, newKey, key)
    }

    
    // MARK: WRITE FILE
    
    private func generateFile(){
        let _ = writeToFile(fileName: mode.textFileName, writeText: textGenerated, filePath: self.pathToSave)
        let _ = writeToFile(fileName: mode.imageFileName, writeText: imagesGenerated, filePath: self.pathToSave)
    }
    
    func writeToFile(fileName: String, writeText: String, filePath: String) -> Bool {
        let fileURL = URL(fileURLWithPath: filePath).appendingPathComponent(fileName)
      
        do {
            try FileManager.default.createDirectory(atPath: self.pathToSave, withIntermediateDirectories: true, attributes: nil)
            try writeText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Error: fileURL failed to write: \n\(error)" )
            return false
        }
        return true
    }
      
    func fileExist(path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let fm = FileManager.default
        return (fm.fileExists(atPath: path, isDirectory: &isDirectory))
    }

}

extension String {
    func manualyHexToInt() -> Double {
        var num: Double = 0
        var index: Double = 0;
        String(self.reversed()).forEach { character in
            num = num + Double((Int(String(character), radix: 16) ?? 1)) * pow(16, index)
            index += 1
        }
        return num;
    }
}

