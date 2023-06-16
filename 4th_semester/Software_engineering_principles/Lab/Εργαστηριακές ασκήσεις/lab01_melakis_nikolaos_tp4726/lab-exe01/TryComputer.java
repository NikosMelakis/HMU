public class TryComputer{
    public static void main(String[] args){
        Computer a=new Computer("Dell G3","i7");
        a.setMemory(8);
        System.out.println(a);
        
        Disk[] disks={
        new Disk("WD Elements", "HDD", 1.0),
        new Disk("Seagate", "SSD", 0.5),
        new Disk("WD Elements", "SSD", 1.0),
        new Disk("Toshiba", "SSD", 1.0),
        new Disk("Seagate", "HDD", 1.0),
        new Disk("Samsung", "HDD", 0.5),
        new Disk("Hitachi", "HDD", 1.0),
        new Disk("Samsung", "SSD", 0.2)
        };
        
        a.addDisk(disks[0]);
        a.addDisk(disks[1]);
        a.addDisk(disks[2]);
        a.addDisk(disks[3]);
        a.addDisk(disks[4]);
        a.addDisk(disks[5]);
        a.addDisk(disks[6]);
        a.addDisk(disks[7]);
        
        a.printDisk();
        System.out.println("Disk Capacity: "+a.totalDiskCapacity());
        a.getCount();
        System.out.println("Total Hardware objects generated: "+Hardware.getCount());
    }
}
