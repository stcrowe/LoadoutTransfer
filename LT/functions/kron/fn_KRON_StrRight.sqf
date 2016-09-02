/*
	Author: Kronzky
	Website: http://www.kronzky.info/snippets/strings/index.htm

	Description:
	Returns l characters from the right side of the string.
				 _right=[_str,l] call KRON_StrRight
				 e.g. _right=["abcdefg",3] call KRON_StrRight / _right will be: "efg"
*/
private["_in","_len","_arr","_i","_out"];
	_in=_this select 0;
	_len=_this select 1;
	_arr=[_in] call LT_fnc_KRON_StrToArray;
	_out="";
	if (_len>(count _arr)) then {_len=count _arr};
	for "_i" from ((count _arr)-_len) to ((count _arr)-1) do {
		_out=_out + (_arr select _i);
	};
 _out
