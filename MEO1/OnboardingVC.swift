//
//  OnboardingVC.swift
//  MEO1
//
//  Created by Thành Mai on 12/06/2023.
//

import UIKit
//import GoogleSignIn


class OnboardingVC: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var currentIndexLabel: UILabel!
    private let pageControl = ExtendingPageControl(numberOfPages: 3, currentPage: 0, isCircular: false)
    @IBOutlet weak var statrButton: UIButton!
    @IBOutlet weak var pageControlContainerView: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = OnboardingVM()
// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pageControlContainerView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: pageControlContainerView.centerXAnchor, constant: 0).isActive = true
        
        pageControl.centerYAnchor.constraint(equalTo: pageControlContainerView.centerYAnchor, constant: 0).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 61).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 6).isActive = true
        OnboardingCollectionViewCell.registerWithCollectionView(collectionView)
        pageControl.didSetPage = { [weak self] page in
            print(page)
            guard let self = self else { return }
            self.currentIndexLabel.text = "\(page + 1) / 3"
            self.skipButton.isHidden = page == 2
            self.statrButton.isHidden = page < 2
        }
        
        setupViews()
        self.hidenNavigationBar()
       // GIDSignIn.sharedInstance.signOut()
    }
        
    @IBAction func onStartButton(_ sender: Any) {
        //viewModel.onStart()

    }
    
    @IBAction func onSkipButton(_ sender: Any) {
        //viewModel.onStart()

    }
    // MARK: - private methods
    private func setupViews() {
        statrButton.isHidden = true
        statrButton.borderRadius()
        statrButton.setTitle("btn_onboarding_start".localition(), for: .normal)
        skipButton.setTitle("btn_onboarding_skip".localition(), for: .normal)
    }
}

extension OnboardingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = viewModel.onboardingData[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configCell(data: data)
        return cell
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("WIDTH: ", UIScreen.main.bounds.size.width )
//        print("colleciton view index: ", collectionView.index)
        let index = round(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        print(index)
        if index <= 0 {
            pageControl.currentpage = 0
        } else if index >= 2 {
            pageControl.currentpage = 2
        } else {
            pageControl.currentpage = Int(index)
        }
    }
}



