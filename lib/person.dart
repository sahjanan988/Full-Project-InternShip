class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;

  void set age(int newAge) {
    if (newAge >= 0) {
      _age = newAge;
    } else {
      print('Age cannot be negative.');
    }
  }
}

void main() {
  Person person = Person('Alice', 30);
  print(person.name);
  print(person.age);
  person.age = -10; // Invalid age
}