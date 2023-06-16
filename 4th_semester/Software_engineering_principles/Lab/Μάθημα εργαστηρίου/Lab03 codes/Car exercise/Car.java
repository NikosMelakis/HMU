public class Car{
    public Car(String brand, int cc){
        this.brand=brand;
        this.cc=cc;
    }
    public Car(String brand){
        this.brand=brand;
    }
    public void printCar(){
        System.out.println("Car: "+ brand + "CC: " + cc);
    }
    
    public void setCC(int cc){
        this.cc=cc;
    }
    
    private String brand;
    private int cc;    
}

