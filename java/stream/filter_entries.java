package net.bazzline.java.example.loop;

import java.util.Arrays;
import java.util.stream.Stream;

/**
 * @see: https://opensource.com/article/23/1/java-for-loops
 */
public class Example {
  public static void main(String[] args) {

    System.out.printf(":: Java stream example. Removing all entries **not** starting with a >>b<<..%n");

    //create our "data"
    String[] exampleArray = new String[]{"foo", "bar", "baz"};

    //transform plain array into a "streamable" array
    //filter out entries not starting with a b and put the result into another stream
    Stream<String> filteredStream = Arrays.stream(exampleArray).filter(currentExampleString -> currentExampleString.startsWith("b"));

    //we are using a lambda here to process the currentExampleString by printing it
    filteredStream.forEach(currentExampleString -> System.out.println(currentExampleString));
  }
}

