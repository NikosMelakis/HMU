public class Sphere extends Object{
    public Sphere(){
        r=1;
        count+=1;
    }
    
    public Sphere(double r){
        this();
        this.r=r;
    }
    
    public Sphere(double x, double y, double z){
        this(1.);
        this.x=x;
        this.y=y;
        this.z=z;
    }
    
        public Sphere(double r, double x, double y, double z){
        this(x, y,z);
        this.r=r;
    }
    
    public double volume(){
        return 4./3.*PI*r*r*r;
    }
    
    public static int getCount(){
        return count;
    }
    
    
    public final static double PI=3.14;
    
    private static int count;
    
    private double x, y, z;
    private double r;
    }
