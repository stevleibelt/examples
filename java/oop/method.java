package net.bazzline.java.example.method;

/**
 * @see: https://opensource.com/article/23/1/java-methods
 */
public class Example {
  //If a class has a main method, java will execute this on file call
  public static void main(String[] args) {

      long currentTimeMillis = System.currentTimeMillis();
      String currentStatus;

      if ( currentTimeMillis % 2 == 0 ) {
          currentStatus = "good";
      } else {
          currentStatus = "bad";
      }

      outputStatus(currentStatus);
  }

  public static void outputStatus(String status) {
      System.out.printf(":: Current status is >>%s<<.%n", status);
  }
}

