/// @description 事件
live;

img = spr_battle_dialog_box_0
off_x = 5;
off_y = 10;
text = "";
text_style = "{color `black`}{gui true}";
text_end = "{pause}{end}"

spr_max_width = 0;
spr_max_height = 0;


_inst=instance_create_depth(x+off_x,y+off_y,0,text_typer);
_inst.text = text_style + "1111" + text_end;

