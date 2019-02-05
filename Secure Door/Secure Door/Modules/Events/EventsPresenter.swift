//
//  EventsPresenter.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class EventsPresenter {

    // MARK: - Private properties -

    private weak var _view: EventsViewInterface?
    private let _wireframe: EventsWireframeInterface
    private let _interactor: EventsInteractorInterface
    
    private var _items: [Event] = [] {
        didSet {
            _view?.reloadData()
        }
    }

    // MARK: - Lifecycle -

    init(wireframe: EventsWireframeInterface, view: EventsViewInterface, interactor: EventsInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -
extension EventsPresenter: EventsPresenterInterface {
    
    func viewDidLoad() {
        let result = _interactor.getEvents()
        switch result {
        case let .Success(events):
            _items = events
        case let .Error(error):
            _wireframe.showErrorAlert(with: error.localizedDescription)
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return _items.count
    }
    
    func item(at indexPath: IndexPath) -> EventViewItemInterface {
        return _items[indexPath.row]
    }
    
}
