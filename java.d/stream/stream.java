package net.bazzline.java.example.loop;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * @see: https://opensource.com/article/23/1/java-for-loops
 */
public class Example {
  public static void main(String[] args) {

    System.out.printf(":: Java stream example. Dumping number of entries.%n");

    //create our "data"
    String[] exampleArray = new String[]{"foo", "bar", "baz"};

    //transform plain array into a "streamable" array
    Stream<String> exampleStream = Arrays.stream(exampleArray);

    //we are using a lambda here to process the currentExampleString by printing it
    exampleStream.forEach(currentExampleString -> System.out.println(currentExampleString));
  }
}

