//
//  ViewController.swift
//  ReadMoreDemo
//
//  Created by Kondiram Sonawane on 3/17/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ExpandableLabelDelegate,UITextViewDelegate {
   

    
    func textViewDidChange(_ textView: UITextView) {
       
        let size = self.textView.contentSize;
        self.textViewHeightConstraint.constant = size.height+20;
    }
    
    @IBOutlet weak var textView: UITextView!

    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tablewView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tablewView1.delegate = self
        self.tablewView1.dataSource = self
        tablewView1.estimatedRowHeight = 44
        tablewView1.rowHeight = UITableViewAutomaticDimension
        self.textView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tablewView1.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.labl.delegate = self
        cell.labl.collapsedAttributedLink = NSAttributedString(string: "Read More")
        cell.labl.expandedAttributedLink = NSAttributedString(string: "Read Less")
        //cell.labl.setLessLinkWith(lessLink: "Close", attributes: [.foregroundColor:UIColor.red], position: nil)
        cell.layoutIfNeeded()
        cell.labl.shouldCollapse = true
        cell.labl.textReplacementType = .word
        cell.labl.numberOfLines = 3
        cell.labl.collapsed = true
        cell.labl.text = "On third line our text need be collapsed because we have ordinary text, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textView.resignFirstResponder()
    }
    // MARK: ExpandableLabel Delegate
    
    
    func willExpandLabel(_ label: ExpandableLabel) {
        tablewView1.beginUpdates()
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tablewView1)
        if let indexPath = tablewView1.indexPathForRow(at: point) as IndexPath? {
            DispatchQueue.main.async { [weak self] in
                self?.tablewView1.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tablewView1.endUpdates()
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        tablewView1.beginUpdates()
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tablewView1)
        if let indexPath = tablewView1.indexPathForRow(at: point) as IndexPath? {
            
            DispatchQueue.main.async { [weak self] in
                self?.tablewView1.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tablewView1.endUpdates()
    }


}





