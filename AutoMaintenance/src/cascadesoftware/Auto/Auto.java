package cascadesoftware.Auto;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class Auto extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Auto() {
		add(new MainPanel());
	}

	public static void main(String[] args) 
		throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
		
		// The newInstance() call is a work around for some
		// broken Java implementations
		// Class.forName("com.mysql.jdbc.Driver");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/automaintenance", "root", "amos32");
		
		Auto autoFrame = new Auto();
		
		// Create and populate combo box for list of autos being tracked
		JComboBox<String> autoCombo = new JComboBox<String>();
		
		// Get list of autos
		Statement statement = connect.createStatement();
		String sql = "select name from auto";
		ResultSet resultSet = statement.executeQuery(sql);
		
		// Populate combo box with list of autos
		while (resultSet.next())
			autoCombo.addItem(resultSet.getString(1));
		
		// Build array of maintenance data for currently selected auto
		// Get id of current auto
		sql = "select id_auto from auto where name = " + autoCombo.getSelectedItem() + "limit 1";
		resultSet = statement.executeQuery(sql);
		int currentAuto = resultSet.getInt(1);
		System.out.println("id_auto = " + currentAuto);
		
		//Get that auto's maintenance data
		// First get the data from the databse
		sql = "select * from maintenance where id_auto = " + currentAuto;
		resultSet = statement.executeQuery(sql);
		// Second, put the data into an array...
		// Except we don't know the length of the array, so our other option (for the JTable) is to use a Vector.
		Vector<String> vecData = new Vector<String>();
		// The question is: How do I get/create a row of data to add as an element to the Vector?
		// Answer: Build a String, one column at a time
		String[] obj = new String[7];
		
		while (resultSet.next())
			obj[1] = resultSet.getString(1); obj[2] = resultSet.getString(2); obj[3] = resultSet.getString(3);
			obj[4] = resultSet.getString(4); obj[5] = resultSet.getString(5); obj[6] = resultSet.getString(6);
			obj[7] = resultSet.getString(7);
			vecData.addElement(obj);
		
		JTable jtblTaskTable= new JTable(vecData, vecCol); 

		autoFrame.setTitle("TestAuto");
		autoFrame.setSize(800, 500);
		autoFrame.setLocationRelativeTo(null); // center the frame
		autoFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		autoFrame.setVisible(true);
	}
}
