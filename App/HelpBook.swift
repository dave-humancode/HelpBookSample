//
//  HelpBook.swift
//  HelpTester
//
//  Created by Dave Rahardja on 5/20/23.
//

import Foundation

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

/// A HelpBook
class HelpBook {
    private let helpBookBundle: Bundle

    /// Initialize by name
    ///
    /// - Parameters:
    ///   - bookName: Name of HelpBook
    ///   - bundle: The bundle the HelpBook resides in. Pass `nil` to use the
    ///             main bundle.
    init(bookName: String, bundle: Bundle?) {
        let bundle = bundle ?? Bundle.main
        guard let bundleURL = bundle.url(forResource: bookName, withExtension: "help"),
              let helpBookBundle = Bundle(url: bundleURL)
        else {
            fatalError("Cannot open HelpBook named “\(bookName)”")
        }
        self.helpBookBundle = helpBookBundle
    }

    private func open(url: URL) {
#if os(iOS)
        let app = UIApplication.shared
        app.open(url)
#elseif os(macOS)
        let workspace = NSWorkspace.shared
        workspace.open(url)
#endif
    }

    private var helpBookIdentifier: String { get {
        guard let identifier = self.helpBookBundle.bundleIdentifier else {
            fatalError("HelpBook bundle does not have a bundle identifier")
        }
        return identifier
    }}

    private var appIdentifier: String { get {
        guard let identifier = Bundle.main.bundleIdentifier else {
            fatalError("Main bundle does not have a bundle identifier")
        }
        return identifier
    }}

    private func open(urlString: String) {
        if let url = URL(string: urlString) {
            open(url: url)
        }
    }

    /// Show the title page of this help book
    func show() {
        let urlString = "help:openbook=%22\(helpBookIdentifier)%22"
        open(urlString: urlString)
    }

    /// Show an anchor in this help book
    func show(anchor: String) {
        let urlString = "help:anchor=\(anchor)%20bookID=%22\(helpBookIdentifier)%22"
        open(urlString: urlString)
    }

    /// Search for a string in this help
    func search(string: String) {
        let urlString = "help:search=%22\(string)%22%20bookID=%22\(helpBookIdentifier)%22"
        open(urlString: urlString)
    }
}
