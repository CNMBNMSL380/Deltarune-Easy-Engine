/// @description 事件
live;
_surface_friendClass = -1

suf_width = display_get_width();
suf_height = 480;

text = "";
text_list = ["笨蛋1","笨蛋2","笨蛋3","笨蛋4","笨蛋5"];		//字体列表，用于呈现文本列表布局
text_act_info = "";											//用于在ACT选择类里呈现info介绍
text_style = "";	//放在最前面，用于装饰字体
text_inst = [];
text_layout = 0;	// 0 = 正常文本对话，1 = 列表文本，往下生成， 2 = 网格列表文本 
text_offset = 0;	// 用于1号的垂直文本，

choice_select = true // 如果为true，则启动选择界面
choice_num = 0;



pos_y = 240;
border_color = make_colour_rgb(51,32,51);
bg_color = c_black;
