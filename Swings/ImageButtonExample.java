/* 4c. Develop a Swing program in Java to display a message “Digital Clock is pressed” or “Hour
Glass is pressed” depending upon the Jbutton with image either Digital Clock or Hour Glass is
pressed by implementing the event handling mechanism with addActionListener( ).*/

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
public class ImageButtonExample {
JLabel l1;
ImageButtonExample (){
JFrame f=new JFrame("Image Button Example");
l1=new JLabel();
l1.setBounds(50,50, 700,100);
l1.setFont(new Font("Lucida Calligraphy",Font.BOLD,20));
JButton b=new JButton(new ImageIcon("C:\\Users\\KUSUMA CD\\Downloads\\jpic1.png"));
b.setBounds(150,150,100,100);
JButton b1=new JButton(new ImageIcon("C:\\Users\\KUSUMA CD\\Downloads\\jpic2.png"));
b1.setBounds(500,150,100, 100);
b.addActionListener(new ActionListener(){
public void actionPerformed(ActionEvent e){
l1.setText("You have pressed digital clock!");
}
});
b1.addActionListener(new ActionListener(){
public void actionPerformed(ActionEvent e){
l1.setText("You have pressed hour glass!");
}
});
f.add(b);
f.add(l1);
f.setSize(300,400);
f.add(b1);
f.add(l1);
f.setSize(300,400);
f.setLayout(null);
f.setVisible(true);
f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
}
public static void main(String[] args) {
new ImageButtonExample();
}
}