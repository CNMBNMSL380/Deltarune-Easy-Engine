// Script assets have changed for v2.3.0 see

//-- IS_STEP : 如果is_step 为1则只执行一次，为0则不执行，为-1则无限执行
//-- AUTO_SKIP : 是否启动执行所有步骤后进入下一个序列
function Event_AddSEQ(SEQ,SEQ_POINT,REQUIRE,FUNC,IS_STEP = 1,AUTO_SKIP = false){
	var func = function(){
		if(AUTO_SKIP){
			
		}
	}
	var seq = {
		seq_point : SEQ_POINT,
		require : REQUIRE,
		func : FUNC,
		auto_skip : AUTO_SKIP
	}
	
}