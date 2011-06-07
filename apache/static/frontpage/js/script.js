

function searchBarFocus()       {
	o = document.getElementById("q");
	if (o.value == 'Search for material...')     {
		o.value = '';
	}
}

function searchBarBlur()        {
	o = document.getElementById("q");
	if (o.value == '')      {
		o.value = 'Search for material...';
	}
}
