public class Disk extends Hardware{
    public Disk(String brand, String type, double capacity){
        super("Disk");
        this.brand=brand;
        this.type=type;
        this.capacity=capacity;
    }
    
    @Override
    public String toString(){
        return "Disk "+this.getCount()+": "+super.toString()+" brand: "+brand+" "+capacity+" TB "+type+"";
    }
    
    public double getCapacity(){
        return capacity;
    }
    
    private String brand, type;
    private double capacity;
}