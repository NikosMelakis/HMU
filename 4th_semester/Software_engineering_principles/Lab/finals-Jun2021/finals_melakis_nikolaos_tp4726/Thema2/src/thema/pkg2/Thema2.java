package thema.pkg2;

import javax.swing.event.*;
import java.awt.*;
import javax.swing.*;
class solve extends JFrame implements ChangeListener {
 
    // frame
    static JFrame f;
 
    // slider
    static JSlider b;
 
    // label
    static JLabel l;
 
    // main class
    public static void main(String[] args)
    {
        // create a new frame
        f = new JFrame();
 
        // create a object
        solve s = new solve();
 
        // create label
        l = new JLabel();
 
        // create a panel
        JPanel p = new JPanel();
 
        // create a slider
        b = new JSlider(0, 100, 20);
 
        // paint the ticks and tracks
        b.setPaintTrack(true);
        b.setPaintTicks(true);
        b.setPaintLabels(true);
 
        // set spacing
        b.setMajorTickSpacing(50);
        b.setMinorTickSpacing(5);
 
        // setChangeListener
        b.addChangeListener(s);
 
        // set orientation of slider
        b.setOrientation(SwingConstants.VERTICAL);
 
        // set Font for the slider
        b.setFont(new Font("Serif", Font.ITALIC, 20));
 
        // add slider to panel
        p.add(b);
        p.add(l);
 
        f.add(p);
 
        // set the text of label
        l.setText("value of Slider is =" + b.getValue());
 
        // set the size of frame
        f.setSize(300, 300);
 
        f.show();
    }
 
    // if JSlider value is changed
    public void stateChanged(ChangeEvent e)
    {
        l.setText("value of Slider is =" + b.getValue());
    }
}