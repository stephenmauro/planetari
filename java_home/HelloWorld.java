package java_home;

class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World Again");
        for (String arg : args) {
            System.out.print(arg);
            System.out.print(" ");
        }
        System.out.println();
    }
}