![](/Screenshots/TheViewWithText.png) 

[![License](https://img.shields.io/badge/license-MIT-green)]()
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey)]()
[![Language](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)]()

#### A view with rounded corners with an ability to make some corners look folded

## Example
![](/Screenshots/Measurements.png)
```swift
let foldedCornerView = FoldedCornerView(frame: CGRect(x: 30, y: 100, width: 150, height: 35))
foldedCornerView.backgroundColor = UIColor.clear
foldedCornerView.mainColor = UIColor(red: 3 / 255, green: 132 / 255, blue: 252 / 255, alpha: 1)
foldedCornerView.foldedCornerColor = UIColor(red: 6 / 255, green: 83 / 255, blue: 186 / 255, alpha: 1)
foldedCornerView.cornerRadius = 10
foldedCornerView.foldedCornerHeight = 17
foldedCornerView.foldedCornerMask = [.layerMaxXMinYCorner]
```

## Author

Viktar Tsialitsyn meandmymouse@gmail.com

## License

FoldedCornerView is available under MIT license. See the LICENSE file for more info.