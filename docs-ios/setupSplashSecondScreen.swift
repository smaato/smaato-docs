// ViewController.swift
import UIKit
import SmaatoSDKInterstitial
 
class ViewController: UIViewController { 
    private var interstitial: SMAInterstitial?
 
    override func viewDidLoad() {
         super.viewDidLoad()
         let params = SMAAdRequestParams()
         params.isSplash = true
         SmaatoSDK.loadInterstitial(forAdSpaceId: "SMAATO_ADSPACE_ID", delegate: self, requestParams: params)
    }
}
