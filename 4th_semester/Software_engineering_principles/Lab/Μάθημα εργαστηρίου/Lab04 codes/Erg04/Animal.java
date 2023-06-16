public abstract class Animal{
    public Animal(String species){
        this.species=species;
    }
    
    @Override
    public String toString(){
        return "It is a "+species+"! ";
    }
    
    public int getCount(){
        return count;
    }
        
    private String species;
    private static int count;
}
