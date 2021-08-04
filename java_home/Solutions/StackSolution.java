import java.util.Stack;

public class StackSolution {

    public Integer evaluateRPN(String[] tokens) {
        Stack<Integer> stack = new Stack<>();
        for (String token : tokens) {
            if (token.equals("+") || token.equals("-") || token.equals("*") || token.equals("/")) {
                int second = stack.pop();
                int first = stack.pop();
                stack.push(operation(first, second, token));
            } else {
                stack.push(Integer.valueOf(token));
            }
        }
        return stack.pop();
    }

    public int operation(int first, int second, String token) {
        int result = -1;
        if (token.equals("+")) {
            result = first + second;
        } else if (token.equals("-")) {
            result = first - second;
        } else if (token.equals("*")) {
            result = first * second;
        } else if (token.equals("/")) {
            result = first / second;
        }
        return result;
    }

    public static void main(String[] args) {
        StackSolution stackSolution = new StackSolution();
        String[] data = new String[] { "10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "*", "5", "+"};
        int solution = stackSolution.evaluateRPN(data);
        System.out.println(solution);
    }
}