/* 5c. Develop a Swing program in Java to add the countries USA, India, Vietnam, Canada,
Denmark, France, Great Britain, Japan, Africa, Greenland, Singapore into a JList and
display the capital of the countries on console whenever the countries are selected on the list.*/

import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.util.HashMap;

public class CountryCapitalList extends JFrame {

    public CountryCapitalList() {
        setTitle("Country and Capitals");
        setSize(400, 300);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new FlowLayout());

        // List of countries
        String[] countries = {
            "USA", "India", "Vietnam", "Canada", "Denmark",
            "France", "Great Britain", "Japan", "Africa", "Greenland", "Singapore"
        };

        // Country-capital mapping
        HashMap<String, String> capitalMap = new HashMap<>();
        capitalMap.put("USA", "Washington D.C.");
        capitalMap.put("India", "New Delhi");
        capitalMap.put("Vietnam", "Hanoi");
        capitalMap.put("Canada", "Ottawa");
        capitalMap.put("Denmark", "Copenhagen");
        capitalMap.put("France", "Paris");
        capitalMap.put("Great Britain", "London");
        capitalMap.put("Japan", "Tokyo");
        capitalMap.put("Africa", "Addis Ababa");
        capitalMap.put("Greenland", "Nuuk");
        capitalMap.put("Singapore", "Singapore");

        // Create JList
        JList<String> countryList = new JList<>(countries);
        countryList.setVisibleRowCount(8);
        countryList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane scrollPane = new JScrollPane(countryList);

        // Add listener
        countryList.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent e) {
                if (!e.getValueIsAdjusting()) {
                    String selectedCountry = countryList.getSelectedValue();
                    String capital = capitalMap.get(selectedCountry);
                    System.out.println("Capital of " + selectedCountry + " is: " + capital);
                }
            }
        });

        add(scrollPane);
        setVisible(true);
    }

    public static void main(String[] args) {
        new CountryCapitalList();
    }
}