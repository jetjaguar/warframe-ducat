var axiArray = new Array;
var lithArray = new Array;
var mesoArray = new Array;
var neoArray = new Array;

function primePartCompare(primepartA, primepartB) {
	return primepartB.getDucatValue()-primepartA.getDucatValue();
}

function checkTableCreationTime(timeStr) {
	document.getElementById('generated').innerHTML= "Database created on "+timeStr;
}

function readAndSortDatabase() {
	try {
		createPrimePartDatabase();
	}catch(err) {
		document.getElementById('debug').innerHTML = "Database not generated, execute \"step 1\" in directory";
	}
	checkTableCreationTime(timeGen);
	for (i = 0; i < primePartDB.length; i++) {
		var temp = primePartDB[i];
		if(temp.getRelicTier() == relicEnum.LITH) {
			lithArray.push(temp);
		}
		if(temp.getRelicTier() == relicEnum.MESO) {
			mesoArray.push(temp);
		}
		if(temp.getRelicTier() == relicEnum.NEO) {
			neoArray.push(temp);
		}
		if(temp.getRelicTier() == relicEnum.AXI) {
			axiArray.push(temp);
		}
	}
	lithArray.sort(primePartCompare);
	mesoArray.sort(primePartCompare);
	neoArray.sort(primePartCompare);
	axiArray.sort(primePartCompare);	
}

function printArrayValues(level, inputArray) {
	var table ='<table class="ducat-table"><tr><td>'+level+'</td></tr>';
	for (j = 0; j < inputArray.length; j++) {
		if(j==0) table+='<tr>';
		if(j%4==0) table+='</tr><tr>'
		var temp = inputArray[j];
		table += '<td><div class=ducat-weight-'+temp.getDucatValue()+'>';
		table += temp.getName()+'<br>'+temp.getDucatValue();
		table += '</td></div>';
	}	
	table += '</tr></table>';
	document.getElementById('results').innerHTML=table;
}

function listAxiDucatValues() {
	printArrayValues('Axi', axiArray);
}

function listLithDucatValues() {
	printArrayValues('Lith', lithArray);
}

function listMesoDucatValues() {
	printArrayValues('Meso', mesoArray);
}

function listNeoDucatValues() {
	printArrayValues('Neo', neoArray);
}

window.onload = readAndSortDatabase;