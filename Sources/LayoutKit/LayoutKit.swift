//  LayoutKit
//
//  Created by Irshad Ahmad on 06/07/22.
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

public struct LayoutKit {
    public init() { }
}

public enum LayoutDirection: CaseIterable {
    case horizontal
    case vertical
}

public extension NSDirectionalEdgeInsets {
    static let defaultValue = NSDirectionalEdgeInsets(top: .zero, leading: 12, bottom: .zero, trailing: 12)
}

extension NSCollectionLayoutSection {
    
    // MARK: - Add Header Footer To Section
    /// Add header view to respective section
    /// - Parameters:
    ///   - section: NSCollectionLayoutSection which needs to have header view
    func addHeaderFooterView(_ view: HeaderFooterView) {
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: view.height
            ),
            elementKind: view.identifier,
            alignment: view.position
        )
        self.boundarySupplementaryItems.append(header)
    }
    
    public func creatLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout(section: self)
    }
}
