params ["_str"];

_return = false;

if (typeName _str == "BOOL") then
{
	_return = _str
}
else
{
	_str = toLower _str;

	if (_str == "true") then
	{
		_return = true;
	};

	if (_str == "false") then
	{
		_return = false;
	};
};

_return