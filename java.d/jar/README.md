# Jar example for Java

## How to create a jar file

* `touch Example.java`
* mkdir `META-INF`
* `echo "Manifest-Version: 1.0" > META-INF/MANIFEST.MF`
* `echo "Main-Class: Main" > META-INF/MANIFEST.MF`
* `javac Example.java`
  * This creates the file `Example.class`
  * You have to repeat this step if you need to package multiple `*.class` files into one jar
* `fastjar cvf Example.jar META-INF Main.class [.class]`
  * `c = compress`
  * `v = verbose`
  * `f = file path`
  * `fastjar [options] <string: name>.jar META-INF [<string: name>.class [<string: name>.class *]]`
* Test it by running `java -jar Example.jar`

### Alternativs to fastjar

* `gjar cvf Example.jar Main.class -m META-INF/MANIFEST.MF`
* `jar --create --file Example.jar --main-class=Main.class`

## Links

* [Creating Jar Files](https://math.hws.edu/eck/cs124/javanotes8/c6/s6.html#GUI1.6.4)

