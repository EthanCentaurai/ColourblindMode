
local D = CreateFrame("Frame", "InterfaceOptionsHelpPanelColorblindModeDropDown", InterfaceOptionsHelpPanel, "UIDropDownMenuTemplate")


local function Click(self)
	ConsoleExec("colorblindsimulator " .. self.value)
	UIDropDownMenu_SetSelectedValue(D, self.value)
end

local function Initialize()
	local selectedValue = UIDropDownMenu_GetSelectedValue(InterfaceOptionsHelpPanelColorblindModeDropDown)
	local info = UIDropDownMenu_CreateInfo()

	info.func = Click

	-- Level 0
	info.text = "None"
	info.value = "0"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 1
	info.text = "Protanopia"
	info.value = "1"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 2
	info.text = "Protanomaly"
	info.value = "2"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 3
	info.text = "Deuteranopia"
	info.value = "3"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 4
	info.text = "Deuteranomaly"
	info.value = "4"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 5
	info.text = "Tritanopia"
	info.value = "5"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 6
	info.text = "Tritanomaly"
	info.value = "6"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 7
	info.text = "Achromatopsia"
	info.value = "7"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)

	-- Level 8
	info.text = "Achromatomaly"
	info.value = "8"

	if info.value == selectedValue then info.checked = 1
	else info.checked = nil end

	UIDropDownMenu_AddButton(info)
end


D:RegisterEvent("CVAR_UPDATE")
D:SetScript("OnEvent", function(self, event, key, value)
	if key == "USE_COLORBLIND_MODE" then
		if value == "1" then
			UIDropDownMenu_EnableDropDown(self)
		else
			ConsoleExec("colorblindsimulator 0")

			UIDropDownMenu_SetSelectedValue(D, "0")
			UIDropDownMenu_DisableDropDown(self)
		end
	end
end)


InterfaceOptionsHelpPanel:SetScript("OnShow", function()
	D:SetPoint("TOPLEFT", InterfaceOptionsHelpPanelColorblindMode, "BOTTOMLEFT")

	InterfaceOptionsHelpPanelMovePad:ClearAllPoints()
	InterfaceOptionsHelpPanelMovePad:SetPoint("TOPLEFT", D, "BOTTOMLEFT", 0, -10)

	UIDropDownMenu_SetWidth(D, 150)
	UIDropDownMenu_Initialize(D, Initialize)
	UIDropDownMenu_SetSelectedValue(D, ColourblindModeDB)

	InterfaceOptionsHelpPanel:SetScript("OnShow", nil)
end)
