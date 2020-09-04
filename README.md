# ResourciOS

Another way of works with literals and images in swift.
ResourciOS is a little program that finds texts and images files in your project and generates different options.

Download the ResourciOS executable and run with the terminal with one of the following options:

### Options
#### - attributesClass - default

With `./ResourciOS attributesClass` command, ResourciOS creates two classes `RText` and `RImage` that look like this:

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
I recommend adding a new scruct `R` with singleton like that:
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
By doing this, we can use our literals in this way `label.text = R.texts.accept`
And our images with `imageView.image = R.image.ico_settings`


#### - methods

With `./ResourciOS methods` command, ResourciOS creates two classes `RText` and `RImage` with methods that look like this:

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

I recommend adding a new scruct `R` with singleton like that:
```swift
struct R {
    static let texts = RTexts()
    static let images = RImages()
}
```
By doing this, we can use our literals in this way `label.text = R.texts.accept()`
And our images with `imageView.image = R.image.ico_settings()`


#### - attributesStruct

With `./ResourciOS attributesStruct` command, ResourciOS creates two structs `RText` and `RImage` with static attributes that look like this:
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
By doing this, we can use our literals in this way `label.text = RTexts.accept`
And our images with `imageView.image = RImage.ico_settings`


#### - staticEnums

With `./ResourciOS staticEnums` command, ResourciOS creates two enums `RText` and `RImage` with static variables that look like this:
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

By doing this, we can use our literals in this way `label.text = RTexts.accept`
And our images with `imageView.image = RImage.ico_settings`

#### - enums

With `./ResourciOS enums` command, ResourciOS creates two enums `RText` and `RImage` that look like this:
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
By doing this, we can use our literals in this way `label.text = RTexts.accept.localized`
And our images with `imageView.image = RImages.ico_settings.image`


### Custom folders
You can define the folder that you want generate the files if you write the path starting with `/` character.
Example: `./ResourciOS attributesClass /folder/subfolder`


### One more thing
You can execute ResourciOS directly in XCode. For it you must add a new Run Script in de build phase tab and write command.
`Build phases -> + -> new Run Script phase`


# ResourciOS - Español

Otra forma de tratar los literales y las imagenes en swift.
ResourciOS es un pequeño programa que busca los textos y las imágenes en los ficheros de tu proyecto y genera diferentes opciones de ficheros.

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
Puedes definir en que carpeta se generan los archivos escribiendo la direccion de esta empezando por el caracter `/`
Ejemplo: `./ResourciOS attributesClass /folder/subfolder`

### One more thing
Puedes ejecutar ResourciOS directamente en XCode. Basta con añadir un script: `Build phases -> + -> new Run Script phase` y poner el comando deseado.
