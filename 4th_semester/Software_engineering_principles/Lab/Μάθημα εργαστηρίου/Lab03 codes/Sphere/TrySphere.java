public class TrySphere{
    public static void main(String[] args){

        Sphere a=new Sphere();
        System.out.println(a);
        Sphere b=new Sphere(4.);
        System.out.println(b);
        Sphere c=new Sphere(4., 5., 6.7);
        System.out.println(c);
        Sphere d=new Sphere(8., 12., 5., 7.);
        System.out.println(d);
        
        System.out.println(a.volume());
        System.out.println(b.volume());
        System.out.println(c.volume());
        System.out.println(b.volume());
    }
}