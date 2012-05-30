function star1select() {
    document.star1.src="/static/search/img/yellowstar.jpg;"
}

function star1deselect() {
    document.star1.src="/static/search/img/graystar.png";
}

function star2select() {
    document.star1.src="/static/search/img/yellowstar.jpg";
    document.star2.src="/static/search/img/yellowstar.jpg";
}

function star2deselect() {
    document.star1.src="/static/search/img/graystar.png";
    document.star2.src="/static/search/img/graystar.png";
}

function star3select() {
    document.star1.src="/static/search/img/yellowstar.jpg";
    document.star2.src="/static/search/img/yellowstar.jpg";
	document.star3.src="/static/search/img/yellowstar.jpg";
}

function star3deselect() {
    document.star1.src="/static/search/img/graystar.png";
    document.star2.src="/static/search/img/graystar.png";
	document.star3.src="/static/search/img/graystar.png";
}

function star4select() {
    document.star1.src="/static/search/img/yellowstar.jpg";
    document.star2.src="/static/search/img/yellowstar.jpg";
	document.star3.src="/static/search/img/yellowstar.jpg";
	document.star4.src="/static/search/img/yellowstar.jpg";
}

function star4deselect() {
    document.star1.src="/static/search/img/graystar.png";
    document.star2.src="/static/search/img/graystar.png";
	document.star3.src="/static/search/img/graystar.png";
	document.star4.src="/static/search/img/graystar.png";
}

function star5select() {
    document.star1.src="/static/search/img/yellowstar.jpg";
    document.star2.src="/static/search/img/yellowstar.jpg";
	document.star3.src="/static/search/img/yellowstar.jpg";
	document.star4.src="/static/search/img/yellowstar.jpg";
	document.star5.src="/static/search/img/yellowstar.jpg";
}

function star5deselect() {
    document.star1.src="/static/search/img/graystar.png";
    document.star2.src="/static/search/img/graystar.png";
	document.star3.src="/static/search/img/graystar.png";
	document.star4.src="/static/search/img/graystar.png";
	document.star5.src="/static/search/img/graystar.png";
}

/*
Author: Addam M. Driver
Date: 10/31/2006
*/

var sMax;	// Isthe maximum number of stars
var holder; // Is the holding pattern for clicked state
var preSet; // Is the PreSet value onces a selection has been made
var rated;

// Rollover for image Stars //
function rating(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

function rating2(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on2";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

function rating3(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on3";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

function rating4(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on4";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

function rating5(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on5";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}
// For when you roll out of the the whole thing //
function off(me){
	if(!rated){
		if(!preSet){	
			for(i=1; i<=sMax; i++){		
				document.getElementById("_"+i).className = "";
				document.getElementById("rateStatus").innerHTML = me.parentNode.title;
			}
		}else{
			rating(preSet);
			document.getElementById("rateStatus").innerHTML = document.getElementById("ratingSaved").innerHTML;
		}
	}
}

// When you actually rate something //
function rateIt(me){
	if(!rated){
		document.getElementById("rateStatus").innerHTML = document.getElementById("ratingSaved").innerHTML + " :: "+me.title;
		preSet = me;
		rated=1;
		sendRate(me);
		rating(me);
	}
}

// Send the rating information somewhere using Ajax or something like that.
function sendRate(sel){
	alert("Your rating was: "+sel.title);
}
