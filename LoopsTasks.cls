public class LoopsTasks {
    
    /**
* Returns the 'Fizz','Buzz' or an original number as String using the following rules:
* 1) return original number as String
* 2) but if number multiples of three return 'Fizz'
* 3) for the multiples of five return 'Buzz'
* 4) for numbers which are multiples of both three and five return 'FizzBuzz'
*
* @param {number} num
* @return {any}
*
* @example
*   2 =>  '2'
*   3 => 'Fizz'
*   5 => 'Buzz'
*   4 => '4'
*  15 => 'FizzBuzz'
*  20 => 'Buzz'
*  21 => 'Fizz'
*
*/
    public static String getFizzBuzz(Integer num) {
        String res = String.valueOf(num);
        if (Math.mod(num, 3) == 0 ){
            res = 'Fizz';
        }
        if (Math.mod(num, 5) == 0 ){
            res = 'Buzz';
        }
        if (Math.mod(num, 5) == 0 && Math.mod(num, 3) == 0 ){
            res = 'FizzBuzz';
        }    
        return res;
    }
    
    /**
* Returns the factorial of the specified integer n.
*
* @param {number} n
* @return {number}
*
* @example:
*   1  => 1
*   5  => 120
*   10 => 3628800 
*/
    public static Integer getFactorial(Integer num) {
        return num != 1 ? getFactorial(num-1) *num : num;
    }
    
    /**
* Returns the sum of integer numbers between n1 and n2 (inclusive).
*
* @param {number} n1
* @param {number} n2
* @return {number}
*
* @example:
*   1,2   =>  3  ( = 1+2 )
*   5,10  =>  45 ( = 5+6+7+8+9+10 )
*   -1,1  =>  0  ( = -1 + 0 + 1 )
*/
    public static Integer getSumBetweenNumbers(Integer num1, Integer num2) {
        Integer res = 0;
        for (Integer i = num1; i <= num2; i++) {
            res = res + i;
        }
        return res;
    }
    
    /**
* Returns true, if a triangle can be built with the specified sides a,b,c and false in any other ways.
*
* @param {number} a
* @param {number} b
* @param {number} c
* @return {bool}
*
* @example:
*   1,2,3    =>  false
*   3,4,5    =>  true
*   10,1,1   =>  false
*   10,10,10 =>  true
*/
    public static Boolean isTriangle(Integer a, Integer b, Integer c) {
        List<Integer> tring = new Integer[]{a, b, c};
            tring.sort();
        if (Math.pow(tring[2],2) == (Math.pow(tring[0],2) + Math.pow(tring[1],2)) || tring[2] == tring[0] ) {
            return true;
        } else {
            return false; 
        }
    }
    
    /**
* Returns true, if two specified axis-aligned rectangles overlap, otherwise false.
* Each rectangle representing by Map<String, Integer> 
*  {
*     top: 5,
*     left: 5,
*     width: 20,
*     height: 10
*  }
* 
*  (5;5)
*     -------------  
*     |           | 
*     |           |  height = 10
*     ------------- 
*        width=20    
* 
* NOTE: Please use canvas coordinate space (https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#The_grid),
* it differs from Cartesian coordinate system.
* 
* @param {Map<String, Integer>} rect1
* @param {Map<String, Integer>} rect2
* @return {bool}
*
* @example:
*   { top: 0, left: 0, width: 10, height: 10 },
*   { top: 5, left: 5, width: 20, height: 20 }    =>  true
* 
*   { top: 0, left: 0, width: 10, height: 10 },
*   { top:20, left:20, width: 20, height: 20 }    =>  false
*  
*/
    public static Boolean doRectanglesOverlap(Map<String, Integer> rect1, Map<String, Integer> rect2) {
        if ( 
            // tooright
            rect1.get('left') + rect1.get('width') < rect2.get('left')  ||
            // tooleft
            rect1.get('left') > rect2.get('left')  + rect2.get('width') || 
            // tootop
            rect1.get('top') > rect2.get('top') + rect2.get('height') ||
            // toobottom
            rect1.get('top') + rect1.get('height') < rect2.get('top') ){
                return false;    
            } else {
                return true;
            }
    }
    
    /**
* Returns true, if point lies inside the circle, otherwise false.
* Circle is:
*     Center Map<String, Double>: {
*       x: 5,       
*       y: 5
*     },        
*     Radius Integer: 20
* Point is Map<String, Double> 
*  {
*     x: 5,
*     y: 5
*  }
* 
* @param {Map<String, Double>} center
* @param {Integer} raduis
* @param {Map<String, Double>} point
* @return {bool}
*
* @example:
*   center: { x:0, y:0 }, radius: 10, point: { x:0, y:0 }     => true
*   center: { x:0, y:0 }, radius:10,  point: { x:10, y:10 }   => false
*   
*/
    public static Boolean isInsideCircle(Map<String, Double> center, Integer radius, Map<String, Double> point) {
        Double a = point.get('x') - center.get('x');
        Double b = point.get('y') - center.get('y');
        Double c = Math.sqrt(Math.pow(a, 2) +  Math.pow(b, 2)); 
        if ( c >= radius){
            return false; 
        } else {
            return true;
        }
    }
    
    /**
* Returns the first non repeated char in the specified strings otherwise returns null.
*
* @param {string} str
* @return {string}
*
* @example:
*   'The quick brown fox jumps over the lazy dog' => 'T'
*   'abracadabra'  => 'c'
*   'entente' => null
*/
    public static String findFirstSingleChar(String str) {
        str = str.deleteWhitespace();
        String[] chars = str.split('');
        for (Integer i = 0; i < chars.size(); i++) { 
            if(str.substringAfter (chars[i]).indexOf(chars[i]) == -1){
                return chars[i];
            }
        }
        return null;
    }
    
    /**
* Returns the string representation of math interval, specified by two points and include / exclude flags.
* See the details: https://en.wikipedia.org/wiki/Interval_(mathematics)
*
* Please take attention, that the smaller number should be the first in the notation
*
* @param {number} a
* @param {number} b
* @param {bool} isStartIncluded
* @param {bool} isEndIncluded
* @return {string}
*
* @example
*   0, 1, true, true   => '[0, 1]'
*   0, 1, true, false  => '[0, 1)'
*   0, 1, false, true  => '(0, 1]'
*   0, 1, false, false => '(0, 1)'
* Smaller number has to be first :
*   5, 3, true, true   => '[3, 5]'
*
*/
    public static String getIntervalString(Integer a, Integer b, Boolean isStartIncluded, Boolean isEndIncluded) {
        String res = '';
        if (isStartIncluded) {
            res = '[';
        }else {
            res = '(';
        }
        res = res + String.valueOf(Math.min(a, b)) + ', ' + String.valueOf(Math.max(a, b));
        if (isEndIncluded) {
            res = res + ']';
        }else {
            res = res + ')';
        }
        return res;
    }
    
    /**
* Reverse the specified string (put all chars in reverse order)
*
* @param {string} str
* @return {string}
*
* @example:
* 'The quick brown fox jumps over the lazy dog' => 'god yzal eht revo spmuj xof nworb kciuq ehT'
* 'abracadabra' => 'arbadacarba'
* 'rotator' => 'rotator'
* 'noon' => 'noon'
*/
    public static String reverseString(String str) {
        String res = '';
        String[] chars = str.split(' ');
        for (Integer i = chars.size()-1; i >= 0; i--) {
            res = res + chars[i].reverse();
            res = res + ' ';
        }
        return res.trim();
    }
    
    /**
* Reverse the specified integer number (put all digits in reverse order)
*
* @param {number} num
* @return {number}
*
* @example:
*   12345 => 54321
*   1111  => 1111
*   87354 => 45378
*   34143 => 34143
*/
    public static Integer reverseInteger(Integer num) {
        String val = String.valueOf(num);
        val = val.reverse();
        return Integer.valueOf(val); 
    }
    
    /**
* Returns the digital root of integer:
*   step1 : find sum of all digits
*   step2 : if sum > 9 then goto step1 otherwise return the sum
*
* @param {number} n
* @return {number}
*
* @example:
*   12345 ( 1+2+3+4+5 = 15, 1+5 = 6) => 6
*   23456 ( 2+3+4+5+6 = 20, 2+0 = 2) => 2
*   10000 ( 1+0+0+0+0 = 1 ) => 1
*   165536 (1+6+5+5+3+6 = 26,  2+6 = 8) => 8
*/
    public static Integer getDigitalRoot(Integer num) {
        do  {
            String[] chars = String.valueOf(num).split('');
            num = 0;
            for (Integer i = 0; i < chars.size(); i++) {
                num = num + Integer.valueOf(chars[i]);
            }      
        } while (num > 9);      
        return num;
    }
    
    /**
* Returns true if the specified string has the balanced brackets and false otherwise.
* Balanced means that is, whether it consists entirely of pairs of opening/closing brackets
* (in that order), none of which mis-nest.
* Brackets include [],(),{},<>
*
* @param {string} str
* @return {boolean}
*
* @example:
*   '' => true
*   '[]'  => true
*   '{}'  => true
*   '()   => true
*   '[[]' => false
*   ']['  => false
*   '[[][][[]]]' => true
*   '[[][]][' => false
*   '{)' = false
*   '{[(<{[]}>)]}' = true 
*/
    public static Boolean isBracketsBalanced(String str) {
        String[] chars = str.split('');
        List<String> arr = new List<String>();
        Map<String, String> m = new Map<String, String> (); 
        m.put('[', ']');
        m.put('(', ')');
        m.put('{', '}');
        m.put('<', '>');
        for (Integer i = 0; i < chars.size(); i++) { 
            switch on chars[i] {
                when '[','(', '{', '<' {
                    arr.add(m.get(chars[i]));
                }
                when ']',')', '}', '>'  {
                    if(arr.size() == 0 || arr.get(arr.size()-1) != chars[i]){
                        return false;
                    } else {
                        arr.remove(arr.size()-1);
                    }
                }
            } 
        }
        if(arr.size() != 0 ){
            return false;
        }
        return true;
    }
    
    /**
* Returns the human readable string of time period specified by the start and end time.
* The result string should be constrcuted using the folliwing rules:
*
* ---------------------------------------------------------------------
*   Difference                 |  Result
* ---------------------------------------------------------------------
*    0 to 45 seconds           |  a few seconds ago
*   45 to 90 seconds           |  a minute ago
*   90 seconds to 45 minutes   |  2 minutes ago ... 45 minutes ago
*   45 to 90 minutes           |  an hour ago
*  90 minutes to 22 hours      |  2 hours ago ... 22 hours ago
*  22 to 36 hours              |  a day ago
*  36 hours to 25 days         |  2 days ago ... 25 days ago
*  25 to 45 days               |  a month ago
*  45 to 345 days              |  2 months ago ... 11 months ago
*  345 to 545 days (1.5 years) |  a year ago
*  546 days+                   |  2 years ago ... 20 years ago
* ---------------------------------------------------------------------
*
* @param {DateTime} startDate
* @param {DateTime} endDate
* @return {string}
*
* @example
*   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:01')  => 'a few seconds ago'
*   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:05')  => '5 minutes ago'
*   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-02 03:00:05')  => 'a day ago'
*   DateTime('2000-01-01 01:00:00'), DateTime('2015-01-02 03:00:05')  => '15 years ago'
*
**/
    public static String timespanToHumanString(DateTime startDate, DateTime endDate) {
        Long dt1Long = startDate.getTime();
        Long dt2Long = endDate.getTime();
        Decimal seconds = (dt2Long - dt1Long) / 1000;
        Decimal minutes = seconds / 60;
        Decimal hours = minutes / 60;
        Decimal days = hours / 24;
        Decimal month = days / 30;
        Decimal years = month / 12;
        if (seconds <= 45){
            return 'a few seconds ago';
        }
        if (45 < seconds &&  seconds <= 90){
            return 'a minute ago';
        }
        if (90 < seconds &&  minutes <= 45){
            return minutes.round(System.RoundingMode.HALF_DOWN) + ' minutes ago';
        }
        if (45 < minutes &&  minutes  <= 90){
            return 'an hour ago';
        }
        if (90 < minutes &&  hours <= 22){
            return hours.round(System.RoundingMode.HALF_DOWN) + ' hours ago';
        }
        if (22 < hours &&  hours <= 36){
            return 'a day ago';
        }
        if (36 < hours &&  days <= 25){
            return days.round(System.RoundingMode.HALF_DOWN) + ' days ago';
        }
        if (25 < days &&  days <= 45){
            return 'a month ago';
        }
        if (45 < days &&  days <= 345){
            return month.round(System.RoundingMode.HALF_DOWN) + ' months ago';
        }
        if (345 < days &&  days <= 545){
            return 'a year ago';
        }
        if (days > 545){
            return years.round(System.RoundingMode.HALF_DOWN) + ' years ago';
        }
        return '';
        
    }
}