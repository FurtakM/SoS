-- Interface switch between modern and classic by Serpent
-- Flag used: IS_CLASSIC : bool
-- OW_SETTING_WRITE('INTERFACE', 'IS_CLASSIC', true);

-- false: modern
-- true: classic
INTERFACE_MODERN = 0;
INTERFACE_CLASSIC = 1;

function setIsClassic(VALUE)
	OW_SETTING_WRITE('INTERFACE', 'IS_CLASSIC', VALUE);
	sgui_debug(0);
end;
