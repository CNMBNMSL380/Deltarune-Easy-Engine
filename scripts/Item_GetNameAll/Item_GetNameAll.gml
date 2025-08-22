// Script assets have changed for v2.3.0 see
function Item_GetNameAll(){
	var itemList = [];
	for(var i =0; i < Item_GetNumber() ; i++){
		itemList[i] = Item_GetName(Item_Get(i));
	}
	return itemList;
}