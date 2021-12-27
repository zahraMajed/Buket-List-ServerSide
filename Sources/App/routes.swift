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

    try app.register(collection: TodoController())
}
