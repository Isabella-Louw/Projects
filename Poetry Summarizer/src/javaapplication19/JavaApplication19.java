/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package javaapplication19;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;





/**
 *
 * @author isabe
 */
public class JavaApplication19 {


   
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        int vowel = 0;
        int consonant = 0;
        int digit = 0;
        int charCount=0;
        int wordCount = 0;
        System.out.println("-------------------------------");
        System.out.println("File Reader Program-Good Poetry");
        System.out.println("-------------------------------");
        while(true){
            
            try{
            String line;
            
            System.out.print("Enter your filename: ");
            String fileName = scanner.nextLine();
            System.out.println("-----------------------------------------------------------");
            BufferedReader reader = new BufferedReader(new FileReader(fileName));
                System.out.println("Filename: " + fileName);
            while((line=reader.readLine())!= null){
           
                System.out.println(line);
                
                String[] words = line.split("\\s+");
                
              
            for(String s: words){
                wordCount++;
            }
            
            
            char[] lineArr = line.toCharArray();
            for(char poem: lineArr){
             
            charCount++;    
            
            
            if(String.valueOf(poem).matches("[aeiouAEIOU]")){
                vowel++;  
            }else{
                consonant++;
            }
            if(Character.isDigit(poem)){
                    digit++;
                }
            }
            }
            reader.close();
            System.out.println("-----------------------------------------------------------");
            System.out.println("Character count: " + charCount);
            System.out.println("Word count: "+ wordCount);
            System.out.println("Vowel count: " + vowel);
            System.out.println("Consonant count: " + consonant);
            System.out.println("Digit count: " + digit);
            System.out.println("----------------------[Bye]-------------------");
            break;
            
            
            }catch(Exception e){
                System.out.println("ERROR: File not found, please ensure that your file exists, or a correct name is entered!!!");
            }

        }

    }

    
}
