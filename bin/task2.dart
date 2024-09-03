import 'dart:io';

import 'taskModel.dart';

// Function to add a new task to the to-do list
void addTask(String description, List toDoList) {
  toDoList.add(taskModel(description: description));
}

// Function to delete a task from the to-do list
void deleteTask(int id, List toDoList) {
  if (id >= 0 && id < toDoList.length) {
    toDoList.removeAt(id);
    print("The Task has been successfully deleted");
  }
}

// Function to change the status of a task (mark it as completed)
void changeStatus(int id, List toDoList) {
  if (id >= 0 && id < toDoList.length) {
    if (toDoList[id].status == false) {
      toDoList[id].status = true;
      print("The Task has been successfully completed");
    } else {
      print("The Task is already complete");
    }
  }
}

// Function to display all tasks, including their status (completed or not)
void displayAllTask(List toDoList) {
  if (toDoList.isNotEmpty) {
    print("All Task:");
    for (int i = 0; i < toDoList.length; i++) {
      print(
          "Task[${i + 1}] : \"${toDoList[i].description}\"  =>  ${toDoList[i].status ? "completed" : "not completed"}\n");
    }
  } else {
    print("There are no tasks yet");
  }
}

// Function to display only the tasks that have been completed
void displayAllTaskCompleted(List toDoList) {
  int j = 0;
  for (int i = 0; i < toDoList.length; i++) {
    if (toDoList[i].status == true) {
      print("All Completed Task:");
      print("Task[${i + 1}]:\"${toDoList[i].description}\"");
      j++;
    }
  }
  if (j == 0) {
    print("There are no complete task yet");
  }
}

// Main function
void main(List<String> arguments) {
  List<taskModel> toDoList =
      []; // Create an empty list to hold taskModel objects

  while (true) {
    // Infinite loop to keep the program running until manually stopped
    print(
        "1.Display All Task.\n2.Display All Task Completed. \n3.Complete A Specific Task.\n4.Add Task.\n5.Delete Task.\n-Choose a process:");
    String? processNum = stdin.readLineSync();
    switch (processNum) {
      // Switch case to handle the user's choice
      case '1':
        displayAllTask(toDoList);
        break;
      case '2':
        displayAllTaskCompleted(toDoList); // Display completed tasks only
        break;
      case '3':
        if (toDoList.isNotEmpty) {
          // Check if there are tasks to complete
          print("Enter The Task Number You Want To Complete:");
          int? taskNumber =
              int.tryParse(stdin.readLineSync()!); // Read the task number input
          changeStatus(taskNumber! - 1, toDoList); // Mark the task as completed
        } else {
          print("There are no tasks to complete");
        }

        break;
      case '4':
        print("Enter The Task Description You Want To Added :");
        String? description =
            stdin.readLineSync(); // Read the task description input
        addTask(description!, toDoList);
        break;
      case '5':
        if (toDoList.isNotEmpty) {
          // Check if there are tasks to delete
          print("Enter The Task Number You Want To Delete :");
          int? taskNumber =
              int.tryParse(stdin.readLineSync()!); // Read the task number input
          deleteTask(taskNumber! - 1, toDoList); // Delete the specified task
        } else {
          print("There are no tasks to delete");
        }

        break;
      default: // If the user enters an invalid option
        print("Enter The Process Number Again");
    }
    print("----------------------------------------------");
  }
}
