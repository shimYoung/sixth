package ac.scggi.app.inheritance;

public class VehicleTest {
	public static void main(String[] args) {
		Vehicle v = new Vehicle("����", 0);
		GroundVehicle gv = new GroundVehicle("����", 10, true);
		
		v.startEngine();
		gv.startEngine();
	}
}
