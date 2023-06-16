import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Thema1 extends JFrame{    
    
    
       
    public Thema1(){
        
    
     
    f=new JFrame("Films and Actions Table");    
    String data[][]={ {"1","title", "fname","lname"},    
                          {"2","title", "fname","lnmae"},    
                          {"3", "title","fname","lname"}};    
    String column[]={"Film ID","Title", "Last Name","First Name"};  
    
    
    jt=new JTable(data,column);    
    jt.setBounds(30,40,200,300);          
    sp=new JScrollPane(jt); 
    
    
    f.add(sp);          
    f.setSize(300,400);    
    f.setVisible(true);    
}     
public static void main(String[] args) {    
    new Thema1();    
}    
private JFrame f, jf;
private JTable jt;
private JScrollPane sp;

}  