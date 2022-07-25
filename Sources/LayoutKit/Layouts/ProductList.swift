//
//  ProductList.swift
//  
//
//  Created by Irshad Ahmad on 06/07/22.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public extension LayoutKit {
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
    static func productListSection(
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
    
    // MARK: - PLP Verticle Product Listing
    /// Add header view to respective section
    /// - Parameters:
    ///   - itemWidth: Item Width
    ///   - itemHeight: Item Height
    ///   - itemSpacing: NSCollectionLayoutDimension
    ///   - contentInsets: NSDirectionalEdgeInsets
    ///   - headerView: Header View
    ///   - footerView: Footer View
    ///   - Returns: UICollectionViewCompositionalLayout
    static func verticleProductListing(
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
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(500)
            ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = itemSpacing
        section.contentInsets = contentInsets
        
        return section
    }
}
