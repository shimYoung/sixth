package ac.scggi.app.inheritance;

public class Animal {
	public void move() {
		System.out.println("Animals can move.");
	}
}

class Dog extends Animal{
	@Override
	public void move() {
		System.out.println("Dog can walk and run.");
	}
}

class DogTest{
	public static void main(String[] args) {
		Animal a = new Animal();
		Animal b = new Dog();
		a.move();
		b.move();
	}
}

