public class hello{
    public static void main(String args[]){
        Car c1 = new Car();
        System.out.println("Car: -speed="+c1.getSpeed());
        c1.setSpeed(150);
        System.out.println("Car: -speed="+c1.getSpeed());
        Car c2 = new Car(200, 6, "Tesla");
        System.out.println("Car: -speed="+c2.getSpeed());

        System.out.println("Car C1: "+c1.toString());
        System.out.println("Car C2: "+c2.toString());

        Track t1= new Track();
        System.out.println("Track T1: "+t1.toString());
        

    }
}