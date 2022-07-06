//
//  Layout+Grid.swift
//  
//
//  Created by Irshad Ahmad on 06/07/22.
//

import UIKit

public extension LayoutKit {
    // MARK: - Get Grid Layout
    /// Add header view to respective section
    /// - Parameters:
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: UICollectionViewCompositionalLayout
    static func gridLayout(
        itemWidth: NSCollectionLayoutDimension = .estimated(50),
        itemHeight: NSCollectionLayoutDimension = .absolute(40),
        itemSpacing: CGFloat = 10,
        contentInsets: NSDirectionalEdgeInsets = .defaultValue,
        headerView: HeaderFooterView? = nil,
        footerView: HeaderFooterView? = nil
    ) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout(
            section: LayoutKit.gridLayoutSection(
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                itemSpacing: itemSpacing,
                contentInsets: contentInsets,
                headerView: headerView,
                footerView: footerView
            )
        )
    }
    
    // MARK: - Get Grid Layout Section
    /// Layout Section like Grid
    /// - Parameters:
    ///   - itemWidth: item width
    ///   - itemHeight: item height
    ///   - itemSpacing: spacing between 2 items
    ///   - contentInsets: section Insets
    ///   - headerView: header view to be added
    ///   - footerView: foote view to be added
    /// - Returns: NSCollectionLayoutSection
    static func gridLayoutSection(
        itemWidth: NSCollectionLayoutDimension = .estimated(50),
        itemHeight: NSCollectionLayoutDimension = .absolute(40),
        itemSpacing: CGFloat = 10,
        contentInsets: NSDirectionalEdgeInsets = .defaultValue,
        headerView: HeaderFooterView? = nil,
        footerView: HeaderFooterView? = nil
    ) -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: itemWidth,
                heightDimension: itemHeight
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(200)
            ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(itemSpacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = itemSpacing
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
