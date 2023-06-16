public class Computer extends Hardware{
    public Computer(String brand, String cpu){
        super("Computer");
        this.brand=brand;
        this.cpu=cpu;
    }
    
    @Override
    public String toString(){
        return super.toString()+": "+brand+" "+cpu+" RAM:"+memory+"GB";
    }
    
    public void addDisk(Disk aDisk){
        if(diskCounter>=10){
            System.out.println("Disk array is full");
            return;
    }
    disks[diskCounter]=aDisk;
    diskCounter++;
    }
    
    public void printDisk(){
       for(int i=0;i<diskCounter;i++){
           if(disks[i]==null)
                break;
            System.out.println(disks[i].toString());
    }
    }
    
    public double totalDiskCapacity(){
        double disksCapacity=0;
        for(int i=0;i<=diskCounter;i++){
            if(disks[i]==null)
                break;
            disksCapacity+=disks[i].getCapacity();
        }
        return disksCapacity;
    }
    
    public void setMemory(int memory){
        this.memory=memory;
    }
    
    private String brand, cpu;
    private int memory;
    private int diskCounter;
    private Disk[] disks=new Disk[10];
}