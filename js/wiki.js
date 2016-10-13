function createCORSRequest(method, url) {
	var xhr = new XMLHttpRequest();
	if("withCredentials" in xhr) {
		xhr.open(method, url, true);
	}else if (typeof XDomainRequest !="undefined") {
		xhr = new XDomainRequest();
		xhr.open(method, url);
	} else {
		xhr = null;
	}
	return xhr;
}

function getWikiRelics() {
	url = 'http://warframe.wikia.com/wiki/Void_Relic/ByRewards/SimpleTable';
	var xhr = createCORSRequest('GET', url);
	if(!xhr) {
		throw new Error('CORS not supported');
	}
	
	xhr.onload = function() {
		var text = xhr.responseText;
		alert('Response from CORSRequest to '+url+': '+text);
	};
	
	xhr.onerror = function() {
		alert('Error making xhr request');
	};
	
	xhr.send();
}