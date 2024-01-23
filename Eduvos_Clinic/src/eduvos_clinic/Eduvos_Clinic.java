/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package eduvos_clinic;

import java.sql.*;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Isabella Louw
 * Date: 15 November 2023
 * Student Number: EDUV4869282
 * Module Code: ITEJA0
 * Project: Version A Question 2
 */
public class Eduvos_Clinic {

    public static void main(String[] args) {
        
        //Declaring variables outside of try blocks
        int id;
        int cellNum;
        
        //Create a Scanner object to read input from the console
        Scanner scanner = new Scanner(System.in);
        
        //Creating object to establish and manage the connection to MySQL database
        Connection con;
        
        try {
            //Loop to allow the code to keep iterating
            while (true){
                //Establishing a connection to MySQL database
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduvos_clinic","root","Sunburst1975");
                
                // Creating a Statement object to execute SQL queries on the database connection
                Statement st = con.createStatement();

                //Welcoming statement
                System.out.println("Welcome to Eduvos Clinic App");
        
        
            
                //Get user input for patient information
            
                System.out.print("Enter Patient name: ");
                String name = scanner.nextLine();
        
                System.out.print("Enter Patient surname: ");
                String surname = scanner.nextLine();
            
                //Get and validate ID Number
                while (true) {
                    System.out.print("Enter ID Number: ");
                    try{
                        id = scanner.nextInt();
                        break;
                    }catch (InputMismatchException invalidId){
                        System.err.println("Error: Invalid input. Enter only integers");
                        //Clear invalid input
                        scanner.next();
                    }
                    }
        
                //Get and validate Cell Number
                while (true) {
                    System.out.print("Enter Cell Number: ");
                    try{
                        cellNum = scanner.nextInt();
                        break;
                    }catch (InputMismatchException invalidCellNum){
                        System.err.println("Error: Invalid input. Enter only integers");
                        //Clear invalid input
                        scanner.next();
                    }
                }
        
                //Get Student Number
                System.out.print("Enter Student Number: ");
                String studNum = scanner.next();
            
                //Check if the user wants to exit
                if (studNum.equals("0")) {
                    System.out.println("Thank you for using the Eduvos Clinic App. Good Bye!");
                    //Exit the application
                    break;
                }
                scanner.nextLine();
                
                //Using prepared statements to interact with the database
                
                //Set the current database to eduvos_clinic
                String query = "USE eduvos_clinic;";
                PreparedStatement p = con.prepareStatement(query);
                //Execute the statement
                p.executeUpdate();
                
                //Insert patient information into the database
                String data = "INSERT INTO patients VALUES(?, ?, ?, ?, ?);";
                PreparedStatement pst = con.prepareStatement(data);
            
                pst.setString(1, name);
                pst.setString(2, surname);
                pst.setInt(3, id);
                pst.setInt(4, cellNum);
                pst.setString(5, studNum);
                
                //Execute the statements
                int rowsInserted = pst.executeUpdate();
                
                //Check if the data was inserted into the database table
                if (rowsInserted > 0) {
                        System.out.println("Connected to the database Eduvos_Clinic");
                        System.out.println("Patient information has successfully been added to database");
                } 

            }
        
        //Exception handling block for handling ClassNotFoundException and SQLException    
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e){
            e.printStackTrace();
        }
  
    }
    

}


        
           
        
 
    


    
    

