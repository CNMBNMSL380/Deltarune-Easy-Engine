// Script assets have changed for v2.3.0 see
function array_sum(){
	var ARRAY = argument[0];
	
    var sum = 0;
    for (var i = 0; i < array_length(ARRAY); i++) {
        var value = ARRAY[i];
        if (is_array(value)) {
            sum += array_sum(value); // 递归调用
        } else {
            sum += value; // 累加值
        }
    }
    return sum;
}