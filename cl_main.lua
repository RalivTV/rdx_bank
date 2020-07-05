RDX = nil

Citizen.CreateThread(function()
	while RDX == nil do
		TriggerEvent('rdx:getSharedObject', function(obj) RDX = obj end)
		Citizen.Wait(100)
	end
end)

----------------------INICIO-----------------------

local bank = {
    { x = -174.44, y = 633.31, z = 114.09}, 
	{ x = -1765.05, y = -384.04, z = 157.74}, 
    { x = -874.99, y = -1328.74, z = 43.96}, 
	{ x = 1231.46, y = -1299.67, z = 76.9}, 
    { x = 2747.06, y = -1395.02, z = 46.18}, 
    { x = 2931.64, y = 1283.17, z = 44.65},
	{ x = -3729.03, y = -2602.94, z = -12.94},
}

local active = false
local BankPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupBankPrompt()
    Citizen.CreateThread(function()
        local str = 'Usar Banco'
        BankPrompt = PromptRegisterBegin()
        PromptSetControlAction(BankPrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(BankPrompt, str)
        PromptSetEnabled(BankPrompt, false)
        PromptSetVisible(BankPrompt, false)
        PromptSetHoldMode(BankPrompt, true)
        PromptRegisterEnd(BankPrompt)
    end)
end

Citizen.CreateThread(function()
	for _, info in pairs(bank) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, -1713383509, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Banco")
    end  
end)

AddEventHandler('rdx:estanamarca', function(zone)
	currentZone     = zone
end)

AddEventHandler('rdx:saiudamarca', function(zone)
    if active == true then
        PromptSetEnabled(BankPrompt, false)
        PromptSetVisible(BankPrompt, false)
        active = false
    end
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupBankPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(bank) do
            local distance = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
            if distance < 1.0 then
                isInMarker  = true
                currentZone = 'bank'
                lastZone    = 'bank'
            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('rdx:estanamarca', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('rdx:saiudamarca', lastZone)
		end

    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if currentZone then
            if active == false then
                PromptSetEnabled(BankPrompt, true)
                PromptSetVisible(BankPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(BankPrompt) then
                OpenMenu()
                PromptSetEnabled(BankPrompt, false)
                PromptSetVisible(BankPrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

-----------------FIM---------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco'].x, Config.Zonas['banco'].y, Config.Zonas['banco'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco1'].x, Config.Zonas['banco1'].y, Config.Zonas['banco1'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco2'].x, Config.Zonas['banco2'].y, Config.Zonas['banco2'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco3'].x, Config.Zonas['banco3'].y, Config.Zonas['banco3'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco4'].x, Config.Zonas['banco4'].y, Config.Zonas['banco4'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco5'].x, Config.Zonas['banco5'].y, Config.Zonas['banco5'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.Zonas['banco6'].x, Config.Zonas['banco6'].y, Config.Zonas['banco6'].z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.9, 255, 255, 0, 155, 0, 0, 2, 0, 0, 0, 0)
	end
end)

function retire_argent()
    local amount = KeyboardInput('KADIR_DEPOT2', ('Retirar Dinheiro'), '', 6)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('RetiréArgent', amount)
        end
    end
end

function depot_argent()
    local amount = KeyboardInput('KADIR_DEPOT', ('Depositar Dinheiro'), '', 6)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('PoserArgent', amount)
        end
    end
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function OpenMenu()

	local elements = {
        {label = ('Retirar Dinheiro'), value = 'money'},
        {label = ('Depositar Dinheiro'), value = 'money2'},
	}

	RDX.UI.Menu.CloseAll()

	RDX.UI.Menu.Open('default', GetCurrentResourceName(), 'actions', {
			title    = 'Banco',
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'money' then
				retire_argent()
            end
            
            if data.current.value == 'money2' then
				depot_argent()
			end

		end, function(data, menu)
			menu.close()
		end)
end