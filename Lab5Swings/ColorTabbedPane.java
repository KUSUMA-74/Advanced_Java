/*5d. Develop a Swing program in Java to create a Tabbed Pan of Cyan, Magenta and Yellow and display 
the concerned color whenever the specific tab is selected in the Pan*/

import java.awt.*;
import javax.swing.*;

public class ColorTabbedPane extends JFrame {

    public ColorTabbedPane() {
        setTitle("Color Tabbed Pane");
        setSize(400, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        // Create Tabbed Pane
        JTabbedPane tabbedPane = new JTabbedPane();

        // Cyan Panel
        JPanel cyanPanel = new JPanel();
        cyanPanel.setBackground(Color.CYAN);
        tabbedPane.addTab("Cyan", cyanPanel);

        // Magenta Panel
        JPanel magentaPanel = new JPanel();
        magentaPanel.setBackground(Color.MAGENTA);
        tabbedPane.addTab("Magenta", magentaPanel);

        // Yellow Panel
        JPanel yellowPanel = new JPanel();
        yellowPanel.setBackground(Color.YELLOW);
        tabbedPane.addTab("Yellow", yellowPanel);

        // Add TabbedPane to Frame
        add(tabbedPane);

        setVisible(true);
    }

    public static void main(String[] args) {
        new ColorTabbedPane();
    }
}