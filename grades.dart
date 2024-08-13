import 'dart:io';

void main() {
  List<int> grades = [];

  // Receive a list of grades
  print('Enter the student\'s grades (type "done" when finished):');
  while (true) {
    String? inputgrade = stdin.readLineSync();
    if (inputgrade!.toLowerCase() == 'done') {
      break;
    }
    int? grade = int.tryParse(inputgrade);
    if (grade != null && grade >= 0 && grade <= 100) {
      grades.add(grade);
    } else {
      print('Invalid grade. Please enter a valid grade number between 0 and 100.');
    }
  }

  // Verify that the grades are valid
  if (grades.isEmpty) {
    print('No valid grades entered. canceling program.');
    return;
  }

  // Calculate the average of the grades
  double average = grades.reduce((a, b) => a + b) / grades.length;

  // Print a message for the student based on the average
  String message = '';
  if (average >= 90) {
    message = 'Excellent!';
  } else if (average >= 70) {
    message = 'Very Good !';
  } else if (average >= 50) {
    message = 'Good.';
  } else {
    message = 'Needs improvement.';
  }

  // Display the average grade and the corresponding message
  print('\nAverage Grade: ${average.toStringAsFixed(2)}');
  print('Message: $message');


 // Display each grade separately
  print('\nEach Grade Separately:');
  for (int j = 0; j < grades.length; j++) {
    print('Grade ${j + 1}: ${grades[j]}');
  }
}
