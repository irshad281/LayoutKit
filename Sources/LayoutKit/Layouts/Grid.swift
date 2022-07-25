//
//  Layout+Grid.swift
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
