package net.bazzline.java.example.loop;

/**
 * @see: https://opensource.com/article/23/1/java-loops
 */
public class Example {
  public static void main(String[] args) {

    int count;
    long currentTimeMillis = System.currentTimeMillis();

    if ( currentTimeMillis%2 == 0 ) {
      count = 128;
    } else {
      count = 32;
    }

    while (true) {
      System.out.printf("   >>%d<<%n", count);

      if ( count <= 0 ) {
        System.out.printf("   Shutting down.%n");
        break;
      } 

      --count;
    }
  }
}

