class Track extends Car{
    int wheels;

    public Track(){
        super(220, 7, "Scania");
        wheels=8;
    }

    public String toString(){
        return("-Speed="+speed+" -Gear="+gear+" -Brand="+brand);
    }
}