/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package celldecoder;

import java.util.Scanner;

/**
 *
 * @author isabe
 */
public class CellDecoder {
     static String num;
     static int zero = 0;
     static int one = 0;
     static int two = 0;
     static int three = 0;
     static int four = 0;
     static int five = 0;
     static int six = 0;
     static int seven = 0;
     static int eight = 0;
     static int nine = 0;

    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        
        while(true){
        System.out.println("Telephone Decoder");

        System.out.print("Enter your Cell Number: ");

        num = scanner.next();
        
        if(isValidNum(num)){
            System.out.println("Well done, your cell number can be broken down as follows:");
            CellDecoder.isValid(num);
            break;
        }else{
            System.out.println("Your cell number is incorrect, please try again");
        }
        

        }
        
    }
    
    public static boolean isValidNum(String num){
        return num.matches("\\d{10}");
    }
    public static void isValid(String num){
        for(char digits : num.toCharArray()){

        if(digits == '0'){
            zero++;
        }
        if(digits == '1'){
            one++;
        }
        if(digits == '2'){
            two++;
        }
        if(digits == '3'){
            three++;
        }
        if(digits == '4'){
            four++;
        }
        if(digits == '5'){
            five++;
        }
        if(digits == '6'){
            six++;
        }
        if(digits == '7'){
            seven++;
        }
        if(digits == '8'){
            eight++;
        }
        if(digits == '9'){
            nine++;
        }
        
        }
        if (zero>1){
            System.out.println("0- " + zero);
        }
        if (one>1){
            System.out.println("1- " + one);
        }
        if (two>1){
            System.out.println("2- " + two);
        }
        if (three>1){
            System.out.println("3- " + three);
        }
        if (four>1){
            System.out.println("4- " + four);
        }
        if (five>1){
            System.out.println("5- " + five);
        }
        if (six>1){
            System.out.println("6- " + six);
        }
        if (seven>1){
            System.out.println("7- " + seven);
        }
        if (eight>1){
            System.out.println("8- " + eight);
        }
        if (nine>1){
            System.out.println("9- " + nine);
        }
        System.out.println("Bye!!!");
    }
    
    
}
