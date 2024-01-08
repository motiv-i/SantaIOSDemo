//
//  STAdTableViewController.swift
//  sample-swift
//
//  Created by Jaeuk Jeong on 12/15/23.
//

import UIKit

/**
 * 샘플 메인
 */
class STAdTableViewController: UITableViewController {

    var sections: [STAdSectionModel] = STAdSection.shared.adSections()
    var time: TimeInterval = -1
    var first: TimeInterval?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func info(indexPath: IndexPath) -> STAdInfoModel {
        return sections[indexPath.section].adAtIndex(indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let indexPath = sender as? IndexPath else {
            return
        }
        let info = self.info(indexPath:indexPath)
        if segue.identifier == "Banner" {
            if let controller = segue.destination as? STBannerAdViewController {
                controller.info = info
            }
        } else if segue.identifier == "Interstitial" {
            if let controller = segue.destination as? STInterstitialAdViewController {
                controller.info = info
            }
        } else if segue.identifier == "Native" {
            if let controller = segue.destination as? STNativeAdViewController {
                controller.info = info
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sections[section].count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let info = self.info(indexPath: indexPath)
        cell.textLabel?.text = info.title
        cell.textLabel?.textColor = UIColor(red: 0.32, green: 0.36, blue: 0.35, alpha: 1)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = self.info(indexPath: indexPath)
        switch info.type {
            case .Banner:
                performSegue(withIdentifier: "Banner", sender: indexPath)
            case .Interstitial:
                performSegue(withIdentifier: "Interstitial", sender: indexPath)
            case .Native:
                performSegue(withIdentifier: "Native", sender: indexPath)
        }
    }

}
