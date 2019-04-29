package ac.scggi.app.inheritance2;

import java.util.ArrayList;

public class PersonTest {
	public static void main(String[] args) {
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Citizen());
		list.add(new Citizen());
		list.add(new Soldier());
		list.add(new Soldier());
		
		for(Person p : list) {
			System.out.println(p.makeMoney(10));
			System.out.println(p.makeMoney(10));
		}
	}
}
