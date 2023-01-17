package net.bazzline.java.example.functional;

import java.util.Random;

/**
 * @see: https://opensource.com/article/23/1/java-methods
 */
public class Day {
  public static String currentStatus;
  public int currentCount;

  //Constructor
  public Day () {
    long currentTimeMillis = System.currentTimeMillis();

    if ( currentTimeMillis % 2 == 0 ) {
      currentStatus = "paradise";
    } else {
      currentStatus = "apocalypse";
    }
  }

  //methods
  public String report() {
    return currentStatus;
  }

  public int counter() {
    Random currentRandom = new Random();
    currentCount += currentRandom.nextInt(100);

    return(currentCount);
  }
}

