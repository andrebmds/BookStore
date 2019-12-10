//
//  BookCollectionViewController.swift
//  BookStore
//
//  Created by André  Bortoli  on 09/12/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ThumbnailCollectionViewCell"

class BookCollectionViewController: UICollectionViewController {
    
    let viewModel = BookCollectionViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ThumbnailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.collectionViewLayout = BookCollectionViewController.makeCollectionViewLayout()
        
        setupUI()

    }

    func setupUI() {
        viewModel.populateBookList()
        
        viewModel.updateLoadingStatus = {
            let _ = self.viewModel.isLoading ? self.activityIndicatorStart() : self.activityIndicatorStop()
        }
        
        viewModel.didFinishFetch = {
            self.collectionView.reloadData()
        }

    }

    private func activityIndicatorStart() {
        //Add view loading
        print("Start loading")
    }
    
    private func activityIndicatorStop() {
        print("Stop loading")
    }
    
    private static func makeCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 2), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0/2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10

        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let bookList = viewModel.bookList else { return 1 }
        return bookList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ThumbnailCollectionViewCell
        guard let cover = viewModel.bookList else { return cell }
        cell.configure(with: cover[indexPath.row])
        return cell
    }
}
