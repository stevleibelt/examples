package net.bazzline.java.example.functional;

public class Example {
  public static void main(String[] args) {
    Day currentDay = new Day();

    String firstReport = currentDay.report();
    String secondReport = currentDay.report();

    System.out.printf(":: Outputting two reports.%n");
    System.out.printf("   Day report one is >>%s<<.%n", firstReport);
    System.out.printf("   Day report two is >>%s<<.%n", secondReport);
  }
}

