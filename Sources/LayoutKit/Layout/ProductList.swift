//
//  ProductList.swift
//  
//
//  Created by Irshad Ahmad on 06/07/22.
//

import UIKit

public extension Layout {
    
    // MARK: - Product List Layout
    /// Add header view to respective section
    /// - Parameters:
    ///   - direction: Scroll Direction
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: UICollectionViewCompositionalLayout
    public class productListLayout(
        direction: LayoutDirection = .horizontal,
        itemWidth: NSCollectionLayoutDimension = .estimated(100),
        itemHeight: NSCollectionLayoutDimension = .estimated(100),
        itemSpacing: CGFloat = 16,
        contentInsets: NSDirectionalEdgeInsets = .defaultValue,
        headerView: HeaderFooterView? = nil,
        footerView: HeaderFooterView? = nil)
    -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout(
            section: Layout.productListSection(
                direction: direction,
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                itemSpacing: itemSpacing,
                contentInsets: contentInsets,
                headerView: headerView,
                footerView: footerView
            )
        )
    }
    
    // MARK: - Product List Section
    /// Add header view to respective section
    /// - Parameters:
    ///   - direction: Scroll Direction
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: UICollectionViewCompositionalLayout
    public class productListSection(
        direction: LayoutDirection = .horizontal,
        itemWidth: NSCollectionLayoutDimension = .estimated(100),
        itemHeight: NSCollectionLayoutDimension = .estimated(100),
        itemSpacing: CGFloat = 16,
        contentInsets: NSDirectionalEdgeInsets = .defaultValue,
        headerView: HeaderFooterView? = nil,
        footerView: HeaderFooterView? = nil)
    -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: itemWidth,
                heightDimension: itemHeight
            )
        )
        var group: NSCollectionLayoutGroup!
        switch direction {
        case .horizontal:
            group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: itemWidth,
                    heightDimension: itemHeight
                ),
                subitems: [item]
            )
        case .vertical:
            group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: itemWidth,
                    heightDimension: itemHeight
                ),
                subitems: [item]
            )
        }

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = itemSpacing
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = contentInsets
        
        if let headerView = headerView {
            section.addHeaderFooterView(headerView)
        }
        
        if let footerView = footerView {
            section.addHeaderFooterView(footerView)
        }
        
        return section
    }
}
