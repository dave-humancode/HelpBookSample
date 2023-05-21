//
//  ViewController.swift
//  App
//
//  Created by Dave Rahardja on 5/20/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var helpBook: HelpBook = HelpBook(bookName: "AppHelp", bundle: Bundle(for: type(of: self)))

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showTitlePage(_ sender: AnyObject?) {
        helpBook.show()
    }

    @IBAction func showTopicTwo(_ sender: AnyObject?) {
        helpBook.show(anchor: "TopicTwo")
    }

    @IBAction func searchForOne(_ sender: AnyObject?) {
        helpBook.search(string: "one")
    }
}

