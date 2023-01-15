package net.bazzline.java.example.loop;

/**
 * @see: https://opensource.com/article/23/1/java-loops
 */
public class Example {
  public static void main(String[] args) {

    int count = 0;

    System.out.printf(":: While loop example. Dumping number of entries.%n");

    while (count < 5) {
      System.out.printf("   >>%d<<%n", count);
      ++count;
    }

    System.out.printf("%n");
    System.out.printf("   Done.%n");
  }
}

