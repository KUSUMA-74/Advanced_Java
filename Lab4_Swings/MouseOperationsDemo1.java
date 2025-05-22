/*Develop a simple swing program for illustrating mouse operations such as mouse down, up
double click , single click with help of a button */

import java.awt.event.*;
import javax.swing.*;
public class MouseOperationsDemo1 extends JFrame {
private JButton button;
private JLabel statusLabel;
public MouseOperationsDemo1() {
// Set up the frame

setTitle("Mouse Operations Demo");
setSize(400, 300);
setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
setLocationRelativeTo(null);
setLayout(null);
// Create and set up the button
button = new JButton("Click Me!");
button.setBounds(150, 100, 100, 50); // Set position and size of button
// Create and set up the label to display status
statusLabel = new JLabel("Perform mouse operations on the button.");
statusLabel.setBounds(50, 180, 300, 20); // Set position and size of label
// Add mouse listeners to the button
button.addMouseListener(new MouseAdapter() {
@Override
public void mousePressed(MouseEvent e) {
statusLabel.setText("Mouse Down on Button");
}
@Override
public void mouseReleased(MouseEvent e) {
statusLabel.setText("Mouse Up on Button");
}
@Override
public void mouseClicked(MouseEvent e) {
if (e.getClickCount() == 2) {
statusLabel.setText("Double Click on Button");
} else if (e.getClickCount() == 1) {
statusLabel.setText("Single Click on Button");
}
}
});
// Add components to the frame
add(button);
add(statusLabel);
}
public static void main(String[] args) {
// Create the application and make it visible
SwingUtilities.invokeLater(() -> {
MouseOperationsDemo1 demo = new MouseOperationsDemo1();
demo.setVisible(true);
});
}
}