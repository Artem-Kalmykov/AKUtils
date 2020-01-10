# AKUtils
Different iOS utilities to make life easier.

- [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Carthage](#carthage)
    - [Swift Package Manager](#swift-package-manager)
- [Controls](#controls)
    - [AKTextField](#aktextfield)
        - [Automated next button handling](#automated-next-button-handling)
        - [Insets management](#insets-management)
        - [Actions management](#actions-management)
- [Foundation Extensions](#foundation-extensions)
    - [Decodable+CustomCoding](#decodablecustomcoding)
        - [CustomCodingKeys](#customcodingkeys)
        - [Raw dictionary extraction](#raw-dictionary-extraction)
    - [GCD+Custom](#gcdcustom)
        - [Dispatch After](#dispatch-after)
        - [Dispatch Once](#dispatch-once)
    - [NSObject+Custom](#nsobjectcustom)
    - [String+Custom](#stringcustom)
        - [Search](#search)
        - [Empty](#empty)
        - [Email validation](#email-validation)
        - [Remove HTML tags](#remove-html-tags)
        - [Localization](#localization)
- [UIKit extensions](#uikit-extensions)
    - [UICollectionView](#uicollectionview)
        - [UICollectionView+Custom](#uicollectionviewcustom)
        - [UICollectionViewCell+Custom](#uicollectionviewcellcustom)
    - [UITableView](#uitableview)
        - [UITableView+Custom](#uitableviewcustom)
        - [UITableViewCell+Custom](#uitableviewcellcustom)
    - [UIAlertController](#uialertcontroller)
        - [Simple OK alert](#simple-ok-alert)
        - [Presentation without a view controller](#presentation-without-a-view-controller)
    - [UIImage+Custom](#uiimagecustom)
        - [UIImage with color](#uiimage-with-color)
    - [UIStoryboard+Custom](#uistoryboardcustom)
    - [UIViewController+Custom](#uiviewcontrollercustom)
        - [Storyboard ID](#storyboard-id)
        - [Embedding into navigation controller](#embedding-into-navigation-controller)
- [Utils](#utils)
    - [Empty Closure](#empty-closure)
    - [Optional comparison](#optional-comparison)

# Installation
## Cocoapods
```ruby
pod 'AKUtils'
```
## Carthage
```
github "Artem-Kalmykov/AKUtils"
```
## Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/Artem-Kalmykov/AKUtils.git")
]
```

## Controls

### AKTextField
#### Automated next button handling
Setting `handleReturn` property to `true` enables automatic next/done buttons handling for text fields.
- If `returnKeyType` is `.done` keyboard is automatically dismissed.
- If `returnKeyType` is `.next` first responder status is transfered to a next text field, which should be specified via `nextField` property. It could be set directly in interface builder.

#### Insets management
Text insets could be modified by setting `textInset: UIEdgeInsets` property. It is `.zero` by default.
Additional right view margins could be specified by setting `rightViewInset: UIEdgeInsets` property. It is `.zero` by default.

#### Actions management
Paste, Select, Select All, Copy, Cut and Delete actions may be manually disabled by setting corresponding flag to `false`:
- `isPasteEnabled: Bool`;
- `isSelectEnabled: Bool`;
- `isSelectAllEnabled: Bool`;
- `isCopyEnabled: Bool`;
- `isCutEnabled: Bool`;
- `isDeleteEnabled: Bool`.

## Foundation Extensions

### Decodable+CustomCoding
#### CustomCodingKeys
Used to decode values with yet unknown keys. A key could be created dynamically in runtime by calling `CustomCodingKeys("MyCustomKey")`.
#### Raw dictionary extraction
Used to convert any `Encodable` to raw dictionary by calling `dictionary: [String: Any]?` calculated property.

### GCD+Custom
#### Dispatch After
Call `dispatchAfter()` as a global function and specifying seconds directly, not `.now() + seconds`.
#### Dispatch Once
Call `DispatchQueue.once(token: String, block: () -> ())` to achieve true dispatch once.

### NSObject+Custom
`className` variable is available for both classes and instances.

### String+Custom
#### Search
Call `corresponds(toSearchString: String) -> Bool` to see if a substring exists in the string.
#### Empty
Call static `String.isEmpty(String?)` to see if an optional string is empty. Instance variable `isEmpty` is also redefined to check string count after trimming whitespaces and newlines.
#### Email validation
`var isValidEmail: Bool` validates string as email string by calling regex
```
[a-zA-Z0-9\\'\\+\\-\\_\\%\\.]{2,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" + "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{1,25}" + ")+
```
#### Remove HTML tags
`var removingHTMLTags: String` return the same string, but without HTML tags.
#### Localization
`var localized: String` return the localized version of the string. It also automatically fixes an issue, which uppercases a string, if it is not found in localization table.

## UIKit extensions

### UICollectionView
#### UICollectionView+Custom
Call `dequeueReusableCell` with generic type, instead of reuse ID string. Reuse ID string is taken from `UICollectionViewCell`, see below.
#### UICollectionViewCell+Custom
Implements `var reuseID: String` property, which returns class name by default, but could be overriden.

### UITableView
#### UITableView+Custom
Call `dequeueReusableCell` with generic type, instead of reuse ID string. Reuse ID string is taken from `UITableViewCell`, see below.
#### UITableViewCell+Custom
Implements `var reuseID: String` property, which returns class name by default, but could be overriden.

### UIAlertController
#### Simple OK alert
Call `static func showOKAlert(title: String?, message: String?)` to show simple alert with a localized `OK` button and no button handling.
#### Presentation without a view controller
An alert could be presented without a view controller on a separate window by calling instance function `func show()`. To dismiss such an alert from any point, call `UIAlertController.dismissActiveAlert()`.

### UIImage+Custom
#### UIImage with color
Create a 1x1 image with specified color by calling `UIImage.withColor(UIColor)`

### UIStoryboard+Custom
Instantiate view controllers with generic type instead of specifying a string identifier by calling `instantiate(CustomViewController.self)`. Storyboard ID is obtained from the view controller ifself, see below.

### UIViewController+Custom
#### Storyboard ID
`var storyboardID: String` is generated automatically from class name, but could be overriden.

#### Embedding into navigation controller
Call `func embedInNavigation() -> UINavigationController` to create a `UINavigationController` with the current view controller as its root view controller.

## Utils
### Empty Closure
`public typealias EmptyClosure = (() -> Void)`
### Optional comparison
A number of global infix operators and functions are defined to be able to compare optionals.
