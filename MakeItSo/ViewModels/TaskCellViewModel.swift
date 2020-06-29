//
//  TaskCellViewModel.swift
//  MakeItSo
//
//  Created by Hem Poudyal on 6/26/20.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    
    var id: String = ""
    @Published var completionStateIconName = ""
    private var cancellables = Set<AnyCancellable>()
    
    static func newTask() -> TaskCellViewModel {
        TaskCellViewModel(task: Task(title: "", priority: .medium, completed: false))
    }
    
    init(task: Task) {
      self.task = task

      $task // (8)
        .map { $0.completed ? "checkmark.circle.fill" : "circle" }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)

      $task // (7)
        .map { $0.id }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)

    }
}
