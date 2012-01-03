
local D = CreateFrame("Frame", "InterfaceOptionsHelpPanelColorblindModeDropDown", InterfaceOptionsHelpPanel, "UIDropDownMenuTemplate")


local function Click(self)
	ColourblindModeDB = self.value
	ConsoleExec("colorblindshader "..ColourblindModeDB)
end

local function Initialize()
	local info = UIDropDownMenu_CreateInfo()

	info.func = Click

	-- Level 0
	info.text = "Disabled (default)"
	info.value = "0"

	UIDropDownMenu_AddButton(info)

	-- Level 1
	info.text = "Protanopia"
	info.value = "1"

	UIDropDownMenu_AddButton(info)

	-- Level 2
	info.text = "Protanomaly"
	info.value = "2"

	UIDropDownMenu_AddButton(info)

	-- Level 3
	info.text = "Deuteranopia"
	info.value = "3"

	UIDropDownMenu_AddButton(info)

	-- Level 4
	info.text = "Deuteranomaly"
	info.value = "4"

	UIDropDownMenu_AddButton(info)

	-- Level 5
	info.text = "Tritanopia"
	info.value = "5"

	UIDropDownMenu_AddButton(info)

	-- Level 6
	info.text = "Tritanomaly"
	info.value = "6"

	UIDropDownMenu_AddButton(info)

	-- Level 7
	info.text = "Achromatopsia"
	info.value = "7"

	UIDropDownMenu_AddButton(info)

	-- Level 8
	info.text = "Achromatomaly"
	info.value = "8"

	UIDropDownMenu_AddButton(info)
end


D:RegisterEvent("VARIABLES_LOADED")
D:SetScript("OnEvent", function()
	if not ColourblindModeDB then ColourblindModeDB = "0" end

	ConsoleExec("colorblindshader "..ColourblindModeDB)
end)


InterfaceOptionsHelpPanel:SetScript("OnShow", function()
	D:SetPoint("TOPLEFT", InterfaceOptionsHelpPanelColorblindMode, "TOPRIGHT", 150, -2)

	UIDropDownMenu_SetWidth(D, 150)
	UIDropDownMenu_Initialize(D, Initialize)

	InterfaceOptionsHelpPanel:SetScript("OnShow", nil)
end)
