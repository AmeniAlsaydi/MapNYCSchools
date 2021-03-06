//
//  DetailViewController.swift
//  MapNYCSchools
//
//  Created by Amy Alsaydi on 2/22/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    public var school: School? // not dependency injection fix it
    
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websitelabel: UILabel! // to make this work as a link i would need to give it a gesture so when tapped it goes to a safari viewconteoller.
    
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_:)))
        return gesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        websitelabel.isUserInteractionEnabled = true
        websitelabel.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func didTap(_ gesture: UITapGestureRecognizer) {
        
        guard let website = school?.website else {
            print("no website")
            return
        }
        
        let schoolWebsite = "https://www.\(website)"
        
        if let urlString = URL(string: schoolWebsite) {
            let safariVC = SFSafariViewController(url: urlString)
            present(safariVC, animated: true, completion: nil)
        }
    }

    private func updateUI() {
        guard let school = school else {
            fatalError("no school info was passed ")
        }
        
        schoolName.text = school.school_name
        missionLabel.text = school.overview_paragraph
        addressLabel.text = school.location
        phoneLabel.text = school.phone_number
        faxLabel.text = school.fax_number
        emailLabel.text = school.school_email
        websitelabel.text = school.website
    }

}
