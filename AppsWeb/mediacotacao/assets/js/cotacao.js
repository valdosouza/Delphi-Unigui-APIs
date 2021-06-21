function choiceCity(val,id) {
	if (val == 'N') {
		val = 'S';
	}else{
		val = 'N';
	}	
  document.getElementById(id).setAttribute("value", val);	  
}

function choiceFormats(val,id) {
	if (val == 'N') {
		val = 'S';
	}else{
		val = 'N';
	}	
  document.getElementById(id).setAttribute("value", val);	  
}

function processQtde(id,quant){
	var value = 0;
	if (document.getElementById(id) == null) {
		value = 1;
	}
	else{
		value = parseInt(document.getElementById(id).value);	
	}
    
    value+=quant;
    if(value < 1){
	  value = 1;
    };
	document.getElementById(id).value = value;
}

