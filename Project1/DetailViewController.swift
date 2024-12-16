//
//  DetailViewController.swift
//  Project1
//
//  Created by Илья Колесников on 10.12.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedImageCount = 0
    var totalImageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Picture \(selectedImageCount) of \(totalImageCount)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not Found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage ?? "No Image"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
