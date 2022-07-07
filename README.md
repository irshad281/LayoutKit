# LayoutKit
It's designed on the top of `UICollectionViewCompositionalLayout` in order to provide the advance and custom layouts for your apps. It provides `NSCollectionLayoutSection` and `UICollectionViewCompositionalLayout` for collectionView so you can use either `NSCollectionLayoutSection` if you have multiple sections or directly use layout. 

## Banner layout with horizontal scroll
<img width="300" alt="banner layout" src="https://user-images.githubusercontent.com/19393497/177686560-55f8a7bc-d543-4f73-992c-f565ffe8a496.jpg">

Add banner layout to you collection view in just few lines 
```swift
collectionView.collectionViewLayout = LayoutKit.bannerLayout(
    itemSpacing: 16,
    contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16)
)
```
## PLP
Product List Layout

<img width="300" alt="PLP" src="https://user-images.githubusercontent.com/19393497/177687099-fb345b64-2011-4c57-b87b-54129b5ba339.png">


### Category Section Layout.

```swift
collectionView.collectionViewLayout = LayoutKit.productListSection(
    direction: .horizontal,
    itemHeight: .absolute(40),
    itemSpacing: 16,
    contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
    headerView: HomeLayout.headerView
)
```

### Product List Section Layout.

```swift
collectionView.collectionViewLayout = LayoutKit.productListSection(
    direction: .horizontal,
    itemSpacing: 16,
    contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
    headerView: HomeLayout.headerView
)
```

### Sample home screen with multiple sections.

<img width="300" alt="HomePage" src="https://user-images.githubusercontent.com/19393497/177687576-94585441-4ccb-4371-aa89-77fc90fbaea1.png">

Create your section wise layout and make `UICollectionViewCompositionalLayout`
```swift
func flowLayout() -> UICollectionViewCompositionalLayout {
    UICollectionViewCompositionalLayout { sectionNumber, _ -> NSCollectionLayoutSection in

        let section = self.sections[sectionNumber]
        switch section {

        case .banner:
            return LayoutKit.bannerLayoutSection(
                itemSpacing: 16,
                contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16)
            )

        case .categories:
            return LayoutKit.productListSection(
                direction: .horizontal,
                itemHeight: .absolute(40),
                itemSpacing: 16,
                contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
                headerView: HomeLayout.headerView
            )

        case .burger, .pizza:
            return LayoutKit.productListSection(
                direction: .horizontal,
                itemSpacing: 16,
                contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
                headerView: HomeLayout.headerView
            )

        }
    }
}
``` 
Now simply use the layout in your collectionView
```swift
collectionView.collectionViewLayout = flowLayout()
```

## Tags Layout 

<img width="300" alt="Tagss" src="https://user-images.githubusercontent.com/19393497/177693199-ad935472-91cb-49fb-8dd1-2cec13e6f521.jpg">
 
#### Create Tags layout just like this.
 
```swift
collectionView.collectionViewLayout = LayoutKit.gridLayout(
    headerView: HeaderFooterView(
        identifier: TaskFilterHeader.identifier,
        position: .top,
        height: .estimated(40)
    )
)
```
