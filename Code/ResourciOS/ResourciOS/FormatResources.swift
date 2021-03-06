//
//  FormatResources.swift
//  ResourciOS
//
//  Created by Jorge Morán on 24/02/2020.
//  Copyright © 2020 Jorge Morán. All rights reserved.
//

import Foundation

enum ModeGenerateFile: String {
    
    case attributesStruct
    case attributesClass
    case methods
    case staticEnums
    case enums
    
    var imageFileName: String { return getImageFormat().fileName }
    
    var imageHeader: String { return getImageFormat().header }
    
    var imageBody: String { return getImageFormat().body }
    
    var imageBodyDoc: String { return getImageFormat().bodyDoc }
    
    var textFileName: String { return getTextFormat().fileName }
    
    var textHeader: String { return getTextFormat().header }
    
    var textBody: String { return getTextFormat().body }
    
    var textBodyDoc: String {
        return getTextFormat().bodyDoc
    }
    
    private func getTextFormat() -> ResourcesHelper {
        switch self {
        case .attributesStruct:
            return FormatResourcesStructText()
        
        case .methods:
            return FormatResourcesMethodsText()
            
        case .attributesClass:
            return FormatResourcesClassText()
            
        case .staticEnums:
            return FormatResourcesStaticEnumsText()
            
        case .enums:
            return FormatResourcesEnumsText()
        }
    }
    
    private func getImageFormat() -> ResourcesHelper {
        switch self {
        case .attributesStruct:
            return FormatResourcesStructImages()
        
        case .methods:
            return FormatResourcesMethodsImages()
            
        case .attributesClass:
            return FormatResourcesClassImages()
            
        case .staticEnums:
            return FormatResourcesStaticEnumsImages()
            
        case .enums:
            return FormatResourcesEnumsImages()
        }
    }

}

protocol ResourcesHelper {
    var fileName: String { get }
    var header: String { get }
    var bodyDoc: String { get }
    var body: String { get }
}

// MARK: TEXTS

struct FormatTextCommons {
    var fileName: String = "ResourcingText.swift"
    let header: String = """
//
//  ResourcingText.swift
//  File autogenerated
//
//  Created by Jorge Morán Palomeque.
//  jorgemoranp@gmail.com
//

import Foundation

"""
}

struct FormatResourcesStructText: ResourcesHelper {
    var fileName: String = FormatTextCommons().fileName
    
    var header: String = """
\(FormatTextCommons().header)
public struct RTexts {
%@
}
"""
    var bodyDoc: String = """
    
        
        /**
          Matching with: %@
        */
    """
    
    var body: String = "\n\tpublic static let %@: String = NSLocalizedString(\"%@\", comment: \"\")"
}

struct FormatResourcesMethodsText: ResourcesHelper {
    
    var fileName: String = FormatTextCommons().fileName
    
    var header: String = """
    \(FormatTextCommons().header)
    public class RTexts {
    %@
    }
    """
    
    var bodyDoc: String = """
    
        
        /**
          Matching with: %@
        */
    """
    
    var body: String = "\n\tpublic func %@() -> String { return NSLocalizedString(\"%@\", comment: \"\") }"
    
}

struct FormatResourcesClassText: ResourcesHelper {
    var fileName: String = FormatTextCommons().fileName
    
    var header: String = """
    \(FormatTextCommons().header)
    public class RTexts {
    %@
    }
    """
    
    var bodyDoc: String = """
    
        
        /**
          Matching with: %@
        */
    """
    
    var body: String = "\n\tpublic let %@: String = NSLocalizedString(\"%@\", comment: \"\")"
    
}

struct FormatResourcesStaticEnumsText: ResourcesHelper {
    var fileName: String = FormatTextCommons().fileName
    
    var header: String = """
    \(FormatTextCommons().header)
    public enum RTexts {
    %@
    }
    """
    
    var bodyDoc: String = """
    
        
        /**
          Matching with: %@
        */
    """
    
    var body: String = "\n\tpublic static let %@: String = NSLocalizedString(\"%@\", comment: \"\")"
}

struct FormatResourcesEnumsText: ResourcesHelper {
    var fileName: String = FormatTextCommons().fileName
    
    var header: String = """
    \(FormatTextCommons().header)
    public enum RTexts: String {
    %@
    
        public var localized: String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }
    """
    
    var bodyDoc: String = """
    
        
        /**
          Matching with: %@
        */
    """
    
    var body: String = "\n\tcase %@ = \"%@\""
}


// MARK: Images

struct FormatImageCommons {
    var fileName: String = "ResourcingImages.swift"
    let header: String = """
//
//  ResourcingImages.swift
//  File autogenerated
//
//  Created by Jorge Morán Palomeque.
//  jorgemoranp@gmail.com
//

import Foundation
import UIKit

"""
}

struct FormatResourcesStructImages: ResourcesHelper {
    var fileName: String = FormatImageCommons().fileName
    
    var header: String = """
\(FormatImageCommons().header)
public struct RImages {
%@
}
"""
    
    var bodyDoc: String = ""
    
    var body: String = "\n\tpublic static let %@: UIImage? = UIImage(named: \"%@\")"
}

struct FormatResourcesMethodsImages: ResourcesHelper {
    var fileName: String = FormatImageCommons().fileName
    
    var header: String = """
    \(FormatImageCommons().header)
    public class RImages {
    %@
    }
    """
    
    var bodyDoc: String = ""
    
    var body: String = "\n\tpublic func %@() -> UIImage? { return UIImage(named: \"%@\") }"
}

struct FormatResourcesClassImages: ResourcesHelper {
    var fileName: String = FormatImageCommons().fileName
    
    var header: String = """
    \(FormatImageCommons().header)
    public class RImages {
    %@
    }
    """
    
    var bodyDoc: String = ""
    
    var body: String = "\n\tpublic let %@: UIImage? = UIImage(named: \"%@\")"
}

struct FormatResourcesStaticEnumsImages: ResourcesHelper {
    var fileName: String = FormatImageCommons().fileName
    
    var header: String = """
    \(FormatImageCommons().header)
    public enum RImages {
    %@
    }
    """
    
    var bodyDoc: String = ""
    
    var body: String = "\n\tpublic static let %@: UIImage? = UIImage(named: \"%@\")"
}

struct FormatResourcesEnumsImages: ResourcesHelper {
    var fileName: String = FormatImageCommons().fileName
    
    var header: String = """
    \(FormatImageCommons().header)
    public enum RImages: String {
    %@
        public var image: String {
            return UIImage(named: "ico_store")
        }
    }
    """
    
    var bodyDoc: String = ""
    
    var body: String = "\n\tcase %@ = \"%@\""
    
}
