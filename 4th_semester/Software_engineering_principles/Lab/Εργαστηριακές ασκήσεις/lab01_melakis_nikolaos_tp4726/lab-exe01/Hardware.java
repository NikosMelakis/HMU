public abstract class Hardware{
    public Hardware(String type){
        this.type=type;
    }
    
    @Override
    public String toString(){
        return"HW " +type;
    }
    
    public static int getCount(){
        return count++;
    }
    
    private String type;
    private static int count;
}   