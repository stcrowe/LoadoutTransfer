//    ? KRON_Replace    - Replaces every occurrence of string _old in string _str with string _new
//                        _index=[_str,_old,_new] call KRON_Replace


	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call LT_fnc_KRON_StrToArray;
	_lo=[_old] call LT_fnc_KRON_StrLen;
	_ln=[_new] call LT_fnc_KRON_StrLen;
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out

