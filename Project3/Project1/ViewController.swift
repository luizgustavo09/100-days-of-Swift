//
//  ViewController.swift
//  Project1
//
//  Created by Luiz Gustavo Silva Aguiar on 24/08/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Recommend", style: .plain, target: self, action: #selector(sharedTapped))
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if(item.hasPrefix("nssl")){
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.positionImage = indexPath.row
            vc.numberOfImages = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func sharedTapped(){
        let vc = UIActivityViewController(activityItems: ["Storm Viewer"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

