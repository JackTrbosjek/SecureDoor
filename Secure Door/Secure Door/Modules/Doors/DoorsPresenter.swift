//
//  DoorsPresenter.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class DoorsPresenter {

    weak var view: DoorsViewInterface?
    
    // MARK: - Private properties -
    private let _wireframe: DoorsWireframeInterface
    private let _interactor: DoorsInteractorInterface
    
    private var _items: [Door] = [] {
        didSet {
            view?.reloadData()
        }
    }

    // MARK: - Lifecycle -

    init(wireframe: DoorsWireframeInterface, interactor: DoorsInteractorInterface) {
        _wireframe = wireframe
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension DoorsPresenter: DoorsPresenterInterface {
    
    func viewDidLoad() {
        _items = _interactor.getDoors().success!
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return _items.count
    }
    
    func item(at indexPath: IndexPath) -> DoorViewItemInterface {
        return _items[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}
