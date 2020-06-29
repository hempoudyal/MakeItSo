//
//  TaskListViewModel.swift
//  MakeItSo
//
//  Created by Hem Poudyal on 6/26/20.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation
import Combine
import Resolver

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    @Published var taskRepository: TaskRepository = Resolver.resolve()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map { tasks in
            tasks.map { task in
                TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func removeTasks(atOffsets indexSet: IndexSet) {
        taskCellViewModels.remove(atOffsets: indexSet)
    }
    
    func addTask(task: Task) {
        taskCellViewModels.append(TaskCellViewModel(task: task))
    }
    
}
