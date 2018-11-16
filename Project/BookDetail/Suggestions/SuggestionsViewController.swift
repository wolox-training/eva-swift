//
//  SuggestionsViewController.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

class SuggestionsViewController : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    private let _viewModel : SuggestionsViewModel = SuggestionsViewModel()
    
    private let _view: SuggestionsCollectionView = SuggestionsCollectionView.loadFromNib()!
    private let _rentalsViewModel: RentalsViewModel
    init(viewModel: RentalsViewModel) {
        self._rentalsViewModel = viewModel
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    override func viewDidLoad() {
        
        _view.suggestionsCollection.delegate = self
        _view.suggestionsCollection.dataSource = self
        _viewModel.suggestions.producer.startWithValues { [unowned self] _ in
            self._view.suggestionsCollection.reloadData()
        }
        _rentalsViewModel.rentals.producer.startWithValues { [unowned self] _ in
            if(self._rentalsViewModel.getCount() > 0){
                let book = self._rentalsViewModel.rentals.value.last?.book
                self._viewModel.loadSuggestions(bookId: book?.id ?? 1)
                print("reloading")
            }
        }
        
        _view.backgroundColor = .backgroundColor
        _view.suggestionsCollection.backgroundColor = .backgroundColor
    }
    //Collection view handlers
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = _view.suggestionsCollection.dequeue(cell: SuggestionCell.self, for: indexPath)!
        print("imprimiendo imagen")
        let suggestion = _viewModel.getByIndex(index: indexPath.row)
        suggestion.fetchImage(URL(string:suggestion.image)!).producer.startWithResult { (result) in
            switch result {
            case let .success(img):
                DispatchQueue.main.async { //to execute on main thread
                    cell.image.image = img
                    //cell.portraitImg.image = img
                    //book.isLoad = true
                    //book.imageLoad = img
                }
            case let .failure(error):
                print("Error Finding Image",error)
            }
            
        }
        return cell
    }
}
