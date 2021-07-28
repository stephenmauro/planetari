import java.util.HashMap;
import java.util.Map;
//import java.util.HashMap;

class RomanToInteger{

    public int romanToInt(String s) {
        int symbol = 1; // checks if addition or subtraction 1- addition, 0- subtraction
        Map<Character, Integer> map = new HashMap<>();
        map.put('I' , 1);
        map.put('V' , 5);
        map.put('X' , 10);
        map.put('L' , 50);
        map.put('C' , 100);
        map.put('D' , 500);
        map.put('M' , 1000);
        char[] chs = s.toCharArray();
        int result = 0 ;
        for(int i = 0 ; i < chs.length ; i++){
            if(i < chs.length -1 && map.get(chs[i]) < map.get(chs[i+1])) symbol = 0;
			// anywhere a smaller value symbol shows up before a larger value symbol, 
			//it needs to be subtracted or else that is not a valid Roman numeral
            if(symbol == 1) result += map.get(chs[i]);
            else result -= map.get(chs[i]);
            symbol =1;
        }
        return result;
    }

    public static void main(String[] args) {
        RomanToInteger rti = new RomanToInteger();
        int result = rti.romanToInt("XXII");
        System.out.println(result);
    }  
}