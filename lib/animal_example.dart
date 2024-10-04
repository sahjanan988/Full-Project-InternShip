abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!'); 

  }
}

void main() {
  List<Animal> animals = [Dog(), Cat()];
  animals.forEach((animal) => animal.makeSound());
}