/* DiceRoller.java
 * Author: Brett Harvey
 * Date: September 30th, 2017 
 * Description: This is a simple DiceRoller Class that can be used in RPGs. This will be a good starting point 
 *  and will be added to incrementally until the roller is packed with features. 
 */

import java.util.*;

//Simulates the roll of a Dx Dice and prints the results. 
public class DiceRoller {
	public static void main(String[] args) {
		boolean continueUsing = true;
		
		while (continueUsing != false) {
			// Takes input from the user and converts it into an integer. 
			System.out.println("Please enter the number of faces you would like your dice to have: ");
			Scanner userInputDice = new Scanner(System.in);
			int diceType = userInputDice.nextInt();
		
			// Asking the user to specify the number of rolls they would like to execute. 
			System.out.println("How many times would you like to roll?");
			Scanner userInputRolls = new Scanner(System.in);
			int numberOfRolls = userInputRolls.nextInt();
		
			for (int i = 0; i < numberOfRolls; i++) {
				// New Random number generator
				Random r = new Random(); 
				// Gives result between 0 and parameter 
				int result = r.nextInt(diceType); 
				result++; // Increases the result by 1 so that 0 is not a possible result. 
				System.out.println("You rolled a " + result + " by rolling a D" + diceType);
			}
			System.out.println("Would you like to roll again? true - yes, false - no");
			Scanner userInputContinue = new Scanner(System.in);
		    continueUsing = userInputContinue.nextBoolean();
			
		}
		System.out.println("Thank you for using the dice application"); 
	}
}
