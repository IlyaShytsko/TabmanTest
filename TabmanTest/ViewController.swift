//
//  ViewController.swift
//  TabmanTest
//
//  Created by Ilya Shytsko on 15.09.2022.
//

import Pageboy
import Tabman
import UIKit

final class ViewController: TabmanViewController {
    private var viewControllers = [ViewController1(), ViewController2()]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }

    private func setupBar() {
        dataSource = self

        let bar = TMBar.ButtonBar()

        bar.layout.transitionStyle = .progressive
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit

        bar.backgroundView.style = .clear
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .red
            button.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        bar.indicator.overscrollBehavior = .bounce
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .red
        bar.indicator.transitionStyle = .progressive

        addBar(bar, dataSource: self, at: .top)
    }
}

extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let titles = ["История баллов", "Информация"]
        return TMBarItem(title: titles[index])
    }
}
