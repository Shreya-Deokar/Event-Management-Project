function myFunction(s1,s2)
{
	var s1 = getElementById(s1);
	var s2 = getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "pune")
	{
		var optionArray = ["|","Kothrude|Kothrude","Pashan|Pashan"];
	}
	
	for (option in optionArray)
	{
		var pair = optionArray[option].split("|");
		var newOption = document.createElement(option);
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}