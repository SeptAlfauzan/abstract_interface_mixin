import 'dart:math';

void main() {
  // Circle circle = Circle(2.0);
  // Square square = Square(10.0);
  // Rectangle rectangle = Rectangle(10.0, 2.0);

  // print(circle.name);
  // print(square.name);
  // print(rectangle.name);

  Shape randShape; //use abstract class to intanciate objecr

  Random random = Random(); //get random number from math class
  int choice = random.nextInt(3); //get random number betwen 0 and 2

  switch (choice) {
    case 0: //create circle object
      randShape = Circle(random.nextInt(10) + 1.0);
      break;
    case 1: //create rectangle object
      randShape = Rectangle(random.nextInt(10) + 1.0, random.nextInt(10) + 1.0);
      break;
    case 2: //create square object
      randShape = Square(random.nextInt(10) + 1.0);
      break;
    default:
      print('no choice matches');
  }

  //print randShape base on random number
  print(randShape.name);
  print(randShape.area);
  print(randShape.perimeter);

  A c = C('c');
  //you can treat C object like A object by define the type as A
  c.hi();
  (c as B).goodbye(); //get goodby method from D
  (c as C).goodbye(); //call goodby method from C
  print((c as C).now); //print timestamp
}

//abstract class
abstract class Shape {
  double get perimeter;
  double get area;
  String get name;
}

//interface class
class A {
  void hi() {
    print('hi from A');
  }
}

//interface class
class B {
  String b;
  //constructor
  B(this.b);

  void hi() {
    print('hi from b');
  }

  void goodbye() {
    print('goodbye from b');
  }
}

class C with timeStamp implements A, B {
  //class that use mixin and interface
  C(this.b);

  @override
  String b;

  @override
  void hi() {
    print('hi from c');
  }

  @override
  void goodbye() {
    print('goodbye from c');
  }
}

//mixin class
class timeStamp {
  DateTime _dateNow = DateTime.now();

  get now => _dateNow; //get now variable
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double get area => pi * (radius * radius);

  @override
  String get name => 'Iam circle with radius ${radius}';

  @override
  double get perimeter => radius * 2 * pi;
}

class Rectangle extends Shape {
  double length, width;

  Rectangle(this.length, this.width);

  @override
  double get area => length * width;

  @override
  String get name => 'Iam Rectangle with length: ${length} and width: ${width}';

  @override
  double get perimeter => 2 * (length + width);
}

class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  String get name => 'Iam a square with side of ${length}';
}
