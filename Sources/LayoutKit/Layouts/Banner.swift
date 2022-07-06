//
//  Layout+Banner.swift
//  
//
//  Created by Irshad Ahmad on 06/07/22.
//

import UIKit

public extension LayoutKit {
    // MARK: - Get Banner Layout
    /// Add header view to respective section
    /// - Parameters:
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: UICollectionViewCompositionalLayout
    static func bannerLayout(
        itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1),
        itemHeight: NSCollectionLayoutDimension = .estimated(200),
        itemSpacing: CGFloat = 10,
        contentInsets: NSDirectionalEdgeInsets = .defaultValue,
        headerView: HeaderFooterView? = nil,
        footerView: HeaderFooterView? = nil
    ) -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout(
            section: LayoutKit.bannerLayoutSection(
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                itemSpacing: itemSpacing,
                contentInsets: contentInsets,
                headerView: headerView,
                footerView: footerView
            )
        )
    }
    
    // MARK: - Banner Layout Section
    /// Add header view to respective section
    /// - Parameters:
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: NSCollectionLayoutSection
    static func bannerLayoutSection(
        itemWidth: NSCollectionLayoutDimension = .fractionalWidth(1),
        itemHeight: NSCollectionLayoutDimension = .estimated(200),
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
                widthDimension: itemWidth,
                heightDimension: itemHeight
            ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(itemSpacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        if let headerView = headerView {
            section.addHeaderFooterView(headerView)
        }
        
        if let footerView = footerView {
            section.addHeaderFooterView(footerView)
        }
        
        return section
    }
}
