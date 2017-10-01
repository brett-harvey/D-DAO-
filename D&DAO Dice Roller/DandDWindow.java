import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JRadioButtonMenuItem;
import javax.swing.JMenuItem;
import javax.swing.JLabel;
import java.awt.BorderLayout;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import javax.swing.JTextField;
import java.awt.GridLayout;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import java.awt.FlowLayout;
import java.awt.Color;
import java.awt.Font;

public class DandDWindow {

	private JFrame frame;
	private JTextField textField;
	private JTextField textField_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					DandDWindow window = new DandDWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public DandDWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 557, 355);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("D&DAO Dice");
		lblNewLabel.setFont(new Font("Onyx", Font.PLAIN, 43));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setBounds(164, 9, 198, 58);
		frame.getContentPane().add(lblNewLabel);
		
		JButton btnNewButton = new JButton("Roll Dice");
		btnNewButton.setFont(new Font("Onyx", Font.PLAIN, 30));
		btnNewButton.setBounds(194, 264, 142, 41);
		frame.getContentPane().add(btnNewButton);
		
		JLabel lblNewLabel_1 = new JLabel("");
		lblNewLabel_1.setForeground(Color.RED);
		lblNewLabel_1.setBackground(Color.LIGHT_GRAY);
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setBounds(194, 69, 142, 47);
		frame.getContentPane().add(lblNewLabel_1);
		
		textField = new JTextField();
		textField.setHorizontalAlignment(SwingConstants.CENTER);
		textField.setBounds(194, 177, 142, 20);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setHorizontalAlignment(SwingConstants.CENTER);
		textField_1.setColumns(10);
		textField_1.setBounds(194, 224, 142, 20);
		frame.getContentPane().add(textField_1);
		
		JLabel lblHowManyFaces = new JLabel("How many faces on your dice?");
		lblHowManyFaces.setFont(new Font("Courier New", Font.PLAIN, 12));
		lblHowManyFaces.setHorizontalAlignment(SwingConstants.CENTER);
		lblHowManyFaces.setBounds(10, 161, 521, 14);
		frame.getContentPane().add(lblHowManyFaces);
		
		JLabel lblHowManyTimes = new JLabel("How many times would you like to roll?");
		lblHowManyTimes.setFont(new Font("Courier New", Font.PLAIN, 11));
		lblHowManyTimes.setHorizontalAlignment(SwingConstants.CENTER);
		lblHowManyTimes.setBounds(10, 209, 521, 14);
		frame.getContentPane().add(lblHowManyTimes);
		
		JButton btnNewButton_1 = new JButton("Off");
		btnNewButton_1.setFont(new Font("Onyx", Font.PLAIN, 30));
		btnNewButton_1.setForeground(Color.RED);
		btnNewButton_1.setBounds(10, 9, 57, 49);
		frame.getContentPane().add(btnNewButton_1);
	}
}
