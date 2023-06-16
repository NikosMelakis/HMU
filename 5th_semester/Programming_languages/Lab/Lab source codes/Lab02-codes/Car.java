class Car{
    //Parameters
    int speed, gear;
    String brand;

    //Constructor(s)
    public Car(){
        speed=100;
        gear=5;
        brand= new String("BMW");
    }
    public Car(int speed, int gear, String brand){
        this.speed= speed;
        this.gear = gear;
        this.brand = brand;
    }
    //Methods
    public int getSpeed(){
        return(speed);
    }
    public void setSpeed(int newSpeed){
        speed= newSpeed;
    }
    public String toString(){
        return("-Speed="+speed+" -Gear="+gear+" -Brand="+brand);
    }
}