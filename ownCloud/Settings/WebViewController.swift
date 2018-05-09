//
//  WebViewController.swift
//  ownCloud
//
//  Created by Pablo Carrascal on 03/05/2018.
//  Copyright © 2018 ownCloud GmbH. All rights reserved.
//

/*
 * Copyright (C) 2018, ownCloud GmbH.
 *
 * This code is covered by the GNU Public License Version 3.
 *
 * For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
 * You should have received a copy of this license along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
 *
 */

import UIKit
import WebKit

class WebViewController: UIViewController {

    private var url: URL
    private var titleHeader: String

    init(url: URL, title: String) {
        self.url = url
        self.titleHeader = title
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = titleHeader

        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(webView)

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
