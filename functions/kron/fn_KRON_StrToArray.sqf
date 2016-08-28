/*

	Author: Kronzky
	Website: http://www.kronzky.info/snippets/strings/index.htm

	Description:
	Converts a string into an array of characters.
          _array=[_str] call KRON_StrToArray
          e.g. _array=["abc"] call KRON_StrToArray / _array will be: ["a","b","c"]
*/

private["_in","_i","_arr","_out"];
_in=_this select 0;
_arr = toArray(_in);
_out=[];
for "_i" from 0 to (count _arr)-1 do {
	_out=_out+[toString([_arr select _i])];
};
_out
