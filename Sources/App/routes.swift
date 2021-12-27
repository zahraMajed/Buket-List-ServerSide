import Fluent
import Vapor
import Foundation

func routes(_ app: Application) throws {
    
   var tasksArr = [TODO(objective: "Cooking", createdAt: getTime()),
                   TODO(objective: "Watcing TV", createdAt: getTime())]
    
    app.get("tasks") { req -> [TODO] in
        return tasksArr
    }
    
    func getTime() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        let createdAt = formatter.string(from: currentDate)
        return createdAt
    }
    
    // http://127.0.0.1:8080/addTasks
    app.post("addTasks") { req -> TODO in
        let todo = try req.content.decode(TODO.self)
        let ToDoObj = TODO(objective: todo.objective, createdAt: todo.createdAt)
        tasksArr.append(ToDoObj)
        return ToDoObj
    }

    try app.register(collection: TodoController())
}
