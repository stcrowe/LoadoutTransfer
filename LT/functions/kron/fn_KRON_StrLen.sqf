/*
	Author: Kronzky
	Website: http://www.kronzky.info/snippets/strings/index.htm

	Description:
  Returns the length of the string.
       _len=[_str] call KRON_StrLen
       e.g. _len=["abcdefg"] call KRON_StrLen / _len will be: 7
*/

private["_in","_arr","_len"];
_in=_this select 0;
_arr=[_in] call LT_fnc_KRON_StrToArray;
_len=count (_arr);
_len
