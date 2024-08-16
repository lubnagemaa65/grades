import 'dart:io';

class ToDoList {
  List<String> tasks = [];
  List<String> completedTasks = [];

//Add a Task
  void addTask(String task) {
    tasks.add(task);
    print('Task added successfully!');
  }

//Display tasks
  void displayTasks() {
    if (tasks.isEmpty) {
      print('There are no tasks in the list.');
    } else {
      print('\nTasks:');
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

//Complete a Task
  void EditTask(int taskNumber) {
    if (taskNumber >= 1 && taskNumber <= tasks.length) {
      completedTasks.add(tasks[taskNumber - 1]);
      tasks.removeAt(taskNumber - 1);
      print('marked as completed');
    } else {
      print('Invalid task number. Please try again.');
    }
  }

// Delete a Task
  void deleteTask(int taskNumber) {
    if (taskNumber >= 1 && taskNumber <= tasks.length) {
      tasks.removeAt(taskNumber - 1);
      print('Task deleted successfully!');
    } else {
      print('Invalid task number. Please try again.');
    }
  }

//Display completed Tasks
  void displayCompletedTasks() {
    if (completedTasks.isEmpty) {
      print('No tasks have been completed yet.');
    } else {
      print('\nCompleted Tasks:');
      for (int i = 0; i < completedTasks.length; i++) {
        print('${i + 1}. ${completedTasks[i]}');
      }
    }
  }
}

void main() {
  ToDoList toDoList = ToDoList(); // Create an object of the ToDoList class

  // Start an infinite loop to keep the program running until the user chooses to exit
  while (true) {
    print('\nChoose an option:');
    print('1. Add a Task');
    print('2. Display Tasks');
    print('3. Edit a Task');
    print('4. Delete a Task');
    print('5. Display Completed Tasks');
    print('6. Exit');

    String? choice = stdin.readLineSync(); // Read user input 

    // Process the user's choice using a switch statement
    switch (choice) {
      case '1':
        print('Enter the task:');
        String? task = stdin.readLineSync(); // Allow user to enter a task
        toDoList.addTask(task!); // Call the addTask method to add the task to the list
        break;
      case '2':
        toDoList.displayTasks(); // Call the displayTasks method to show all tasks in the list
        break;
      case '3':
        print('Enter the task number to mark as completed:');
        int taskNumber = int.parse(stdin.readLineSync()!); // Allow user to enter the task number to mark as completed
        toDoList.EditTask(taskNumber); // Call the EditTask method to mark the task as completed
        break;
      case '4':
        print('Enter the task number to delete:');
        int taskNumber = int.parse(stdin
            .readLineSync()!); // Prompt user to enter the task number to delete
        toDoList.deleteTask(taskNumber); // Call the deleteTask method to remove the task from the list
        break;
      case '5':
        toDoList.displayCompletedTasks(); // Call the displayCompletedTasks method to show completed tasks
        break;
      case '6':
        print('Exiting program.');
        return; // Exit the program if the user chooses this
      default:
        print('Invalid choice. Please try again.'); // Display a message for invalid choices
    }
  }
}
