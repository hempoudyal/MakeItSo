//
//  TaskRepository.swift
//  MakeItSo
//
//  Created by Hem Poudyal on 6/27/20.
//  Copyright © 2020 Google LLC. All rights reserved.
//

import Foundation

class BaseTaskRepository {
    @Published var tasks = [Task]()
}

protocol TaskRepository: BaseTaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
}

class TestDataTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    override init() {
        super.init()
        self.tasks = testDataTasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask(_ task: Task) {
        if let index = self.tasks.firstIndex(where: {$0.id == task.id}) {
            self.tasks[index] = task
        }
    }
}

/*
class LocalTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    override init() {
        super.init()
        loadData()
    }
    
    func addTask(_ task: Task) {
        <#code#>
    }
    
    func removeTask(_ task: Task) {
        <#code#>
    }
    
    func updateTask(_ task: Task) {
        <#code#>
    }
}
*/
