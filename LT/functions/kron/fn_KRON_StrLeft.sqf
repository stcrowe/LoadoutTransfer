/*
	Author: Kronzky
	Website: http://www.kronzky.info/snippets/strings/index.htm

	Description:
	Returns l characters from the left side of the string.
				 _left=[_str,l] call KRON_StrLeft
				 e.g. _left=["abcdefg",3] call KRON_StrLeft / _left will be: "abc"
*/

private["_in","_len","_arr","_out"];
	_in=_this select 0;
	_len=(_this select 1)-1;
	_arr=[_in] call LT_fnc_KRON_StrToArray;
	_out="";
	if (_len>=(count _arr)) then {
		_out=_in;
	} else {
		for "_i" from 0 to _len do {
			_out=_out + (_arr select _i);
		};
	};
	_out
