# ResourciOS

ResourciOS is a little program that finds text and image files in your project and generates different options. It is a different way of working with literals and images in Swift.


Download the ResourciOS executable and run it in the terminal with one of the methods described below.

## Options
### - attributesClass - default

Command: `./ResourciOS attributesClass [custom-output-path]`

The `attributesClass` method creates two classes `RText` and `RImage` that look as follows:

```swift
public class RTexts {

    /**
      Matching with: Aceptar, Accept
    */
	public let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public class RImages {

	public let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```
I recommend adding a new struct `R` with singleton as follows:
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
By doing this, we can use our literals like this `label.text = R.texts.accept`, and our images like this `imageView.image = R.image.ico_settings`.


### - methods

Command: `./ResourciOS methods [custom-output-path]`

The `methods` method creates two classes `RText` and `RImage` with methods that look as follows:

```swift
public class RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public func accept() -> String { return NSLocalizedString("accept", comment: "") }
    
    /**
      Matching with: Configuración, Settings
    */
	public func settings() -> String { return NSLocalizedString("settings", comment: "") }
}
```

```swift
public class RImages {

	public func ico_settings() -> UIImage? { return UIImage(named: "ico_settings") }
}
```

I recommend adding a new scruct `R` with singleton as follows:
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
By doing this, we can use our literals like this `label.text = R.texts.accept()`, and our images like this `imageView.image = R.image.ico_settings()`.


#### - attributesStruct

Command: `./ResourciOS attributesStruct [custom-output-path]`

The `attributesStruct` method creates two structs `RText` and `RImage` with static attributes that look as follows:

```swift
public struct RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public static let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public static let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public struct RImages {

	public static let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```
By doing this, we can use our literals like this `label.text = RTexts.accept`, and our images with `imageView.image = RImage.ico_settings`.


#### - staticEnums

Command: `./ResourciOS staticEnums [custom-output-path]`

The `staticEnums` method creates two enums `RText` and `RImage` with static variables that look as follows:

```swift
public enum RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public static let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public static let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public enum RImages {

	public static let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```

By doing this, we can use our literals like this `label.text = RTexts.accept`, and our images with `imageView.image = RImage.ico_settings`.

#### - enums

Command: `./ResourciOS enums [custom-output-path]`

The `enums` method creates two enums `RText` and `RImage` that look as follows:

```swift
public enum RTexts: String{
    
    /**
      Matching with: Aceptar, Accept
    */
	case accept = "accept"
    
    /**
      Matching with: Configuración, Settings
    */
	case settings = "settings"

	public var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
```

```swift
public enum RImages {

	case ico_settings = "ico_settings"

	public var image: UIImage? {
        return UIImage(named: "ico_store")
    }
}
```
By doing this, we can use our literals like this `label.text = RTexts.accept.localized`, and our images with `imageView.image = RImages.ico_settings.image`.


### Custom folders
You can tell ResourciOS in which folder to put the generated files if you write the path starting with the `/` character.
Example: `./ResourciOS attributesClass /folder/subfolder`


### Use ResourciOS in XCode
You can execute ResourciOS directly in XCode. In order to do that you only have to add a new "Run Script" in the "build phase" tab and write the desired command.
`Build phases -> + -> new Run Script phase`


# ResourciOS - Español

ResourciOS es un pequeño programa que busca los textos y las imágenes en los ficheros de tu proyecto y genera diferentes opciones de ficheros. Es una forma diferente de trabajar con los literales y las imágenes en Swift.

Descarga el ejecutable ResouciOS y ejcútalo en la terminal con una de las siguientes opciones:

### Opciones
#### - attributesClass - opción por defecto

Con el comando `./ResourciOS attributesClass` crea dos clases `RText`y `RImage` que tendrán esta apariencia:
```swift
public class RTexts {

    /**
      Matching with: Aceptar, Accept
    */
	public let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public class RImages {

	public let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```

Recomiendo crear un struct `R` con un singleton de ambos.
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
Con esto podemos usar nuestros literales de esta manera `label.text = R.texts.accept`
Y nuestras imágenes de esta manera `imageView.image = R.image.ico_settings`


#### - methods

Con el comando `./ResourciOS methods` crea dos clases `RText`y `RImage` que tendrán esta apariencia:
```swift
public class RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public func accept() -> String { return NSLocalizedString("accept", comment: "") }
    
    /**
      Matching with: Configuración, Settings
    */
	public func settings() -> String { return NSLocalizedString("settings", comment: "") }
}
```

```swift
public class RImages {

	public func ico_settings() -> UIImage? { return UIImage(named: "ico_settings") }
}
```

Recomiendo crear un struct `R` con singleton de ambos.
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
Con esto podemos usar nuestros literales de esta manera `label.text = R.texts.accept()`
Y nuestras imágenes de esta manera `imageView.image = R.image.ico_settings()`


#### - attributesStruct

Con el comando `./ResourciOS attributesStruct` crea dos struct `RText`y `RImage` con atributos estáticos que tendrán esta apariencia:
```swift
public struct RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public static let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public static let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public struct RImages {

	public static let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```
Con esto podemos usar nuestros literales de esta manera `label.text = RTexts.accept`
Y nuestras imágenes de esta manera `imageView.image = RImages.ico_settings`


#### - staticEnums

Con el comando `./ResourciOS staticEnums` crea dos enums `RText`y `RImage` con variables estáticas que tendrán esta apariencia:
```swift
public enum RTexts {
    
    /**
      Matching with: Aceptar, Accept
    */
	public static let accept: String = NSLocalizedString("accept", comment: "")
    
    /**
      Matching with: Configuración, Settings
    */
	public static let settings: String = NSLocalizedString("settings", comment: "")
}
```

```swift
public enum RImages {

	public static let ico_settings: UIImage? = UIImage(named: "ico_settings")
}
```
Con esto podemos usar nuestros literales de esta manera `label.text = RTexts.accept`
Y nuestras imagenes de esta manera `imageView.image = RImages.ico_settings`


#### - enums

Con el comando `./ResourciOS enums` crea dos enums `RText`y `RImage` con métodos estáticos que tendrán esta apariencia:
```swift
public enum RTexts: String{
    
    /**
      Matching with: Aceptar, Accept
    */
	case accept = "accept"
    
    /**
      Matching with: Configuración, Settings
    */
	case settings = "settings"

	public var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
```

```swift
public enum RImages {

	case ico_settings = "ico_settings"

	public var image: UIImage? {
        return UIImage(named: "ico_store")
    }
}
```
Con esto podemos usar nuestros literales de esta manera `label.text = RTexts.accept.localized`
Y nuestras imagenes de esta manera `imageView.image = RImages.ico_settings.image`


### Carpeta personalizada
Puedes definir en qué carpeta se generan los archivos escribiendo la dirección de ésta empezando por el caracter `/`
Ejemplo: `./ResourciOS attributesClass /folder/subfolder`

### Usar ResourciOS en XCode
Puedes ejecutar ResourciOS directamente en XCode. Basta con añadir un script: `Build phases -> + -> new Run Script phase` y poner el comando deseado.
