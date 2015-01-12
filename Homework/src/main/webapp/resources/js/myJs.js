function addItemByKey(e) {
    if (e.keyCode == 13) {
        var objKey = document.getElementById("key_name");
        var objVal = document.getElementById("value_name");
    	
        if (objKey.value != null && objKey.value.length > 0) {
        	if (objVal.value != null && objVal.value.length > 0) {
        		addItem('list_key','list_value','key_name','value_name');
        	} else {
        		objVal.focus();
        	}
        } else {
        	objKey.focus();
        }        
        return false;
    }
}