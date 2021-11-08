//
//  RootPresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class RootPresenter: RootPresenterProtcol {
    weak var interactor: RootInteractorProtocol?
    weak var view: RootViewProtocol?
    weak var router: RootRouterProtocol?
}
