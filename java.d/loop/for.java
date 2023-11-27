package net.bazzline.java.example.loop;

/**
 * @see: https://opensource.com/article/23/1/java-for-loops
 */
public class Example {
  public static void main(String[] args) {

    System.out.printf(":: For loop example. Dumping number of entries.%n");

    for (int counter = 0; counter < 5; ++counter) {
      System.out.printf("   >>%d<<%n", counter);
    }

    System.out.printf("%n");
    System.out.printf("   Done.%n");
  }
}

