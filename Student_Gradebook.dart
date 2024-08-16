class Student {
  String name;
  String ID;
  List<double> _grades = [];

  Student({
    required this.ID,
    required this.name,
  });

  void addGrades(List<double> grade) {
    _grades = grade;
  }

  double averageGrades() {
    if (_grades.isEmpty) {
      return 0.0;
    }
    double total = 0;
    _grades.forEach((grade) {
      total += grade;
    });
    return total / _grades.length;
  }

  void displayGrades() {
    print("Grades for $name (ID: $ID): $_grades");
  }

  bool isPassing(double passingGrade) {
    double average = averageGrades();
    return average >= passingGrade;
  }
}

void main(List<String> args) {
  Student student1 = Student(ID: '4210071', name: 'ashraf');

  List<double> grade = [80, 90, 60, 85, 95, 80];
  student1.addGrades(grade);
  student1.displayGrades();

  double average = student1.averageGrades();
  print("Average grade: ${average.toStringAsFixed(2)}");

  double passingGrade = 50.0;
  if (student1.isPassing(passingGrade)) {
    print("The student passes.");
  } else {
    print("The student fails.");
  }
}
