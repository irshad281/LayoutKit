//
//  HeaderFooterView.swift
//  
//
//  Created by Irshad Ahmad on 05/07/22.
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

public struct HeaderFooterView {
    let identifier: String
    let position: NSRectAlignment
    let height: NSCollectionLayoutDimension
    
    /// - Parameters:
    ///   - identifier: `identifier of Header/Footer` view
    ///   - position: Header/Footer View Position `NSRectAlignment` eg top, bottom
    ///   - height: Height of header/footer view eg `.estimated(50)`
    public init(
        identifier: String,
        position: NSRectAlignment,
        height: NSCollectionLayoutDimension)
    {
        self.identifier = identifier
        self.position = position
        self.height = height
    }
}
