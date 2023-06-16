public class main{
    public static void main(String[] args){
       Car a=new Car("Fiat", 1200);
       Car b=new Car("Ford");
       a.printCar();
       b.printCar();
       b.setCC(1600);
       b.printCar();
    }
}