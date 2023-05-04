var nav = document.getElementsByClassName("mygroup_nav_p");

function clicked(event){
	if(event.target.classList[1] === "clicked") {
		event.target.classList.remove("clicked");
	}else {
		for(var i = 0; i < nav.length; i++){
		nav[i].classList.remove("clicked");
	}
	event.target.classList.add("clicked");
	}
}
function init() {
	for (var i = 0; i < nav.length; i++) {
		nav[i].addEventListener("click", clicked);
	}
}
init();
