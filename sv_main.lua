RDX = nil

TriggerEvent('rdx:getSharedObject', function(obj) RDX = obj end)

RegisterServerEvent("PoserArgent")
AddEventHandler("PoserArgent", function(money)
    local _source = source
    local xPlayer = RDX.GetPlayerFromId(_source)
    local total = money
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= total then

    xPlayer.addAccountMoney('bank', total)
    xPlayer.removeMoney(total)
         TriggerClientEvent('rdx:showAdvancedNotification', source, 'Banque', '~g~FLEE~s~CA', "~b~Vous avez déposer ~g~ "..total.." $ ~w~ en banque !", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('rdx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)

RegisterServerEvent("RetiréArgent")
AddEventHandler("RetiréArgent", function(money)
    local _source = source
    local xPlayer = RDX.GetPlayerFromId(_source)
    local total = money
    local accountMoney = xPlayer.getAccount('bank').money
    --local xMoney = xPlayer.getBank()
    
    --if xMoney >= total then
    if amount == nil or amount <= 0 or amount > accountMoney then

    xPlayer.removeAccountMoney('bank', total)
    xPlayer.addMoney(total)

         TriggerClientEvent('rdx:showAdvancedNotification', source, 'Banque', 'FL~g~EE~s~CA', "~b~Vous avez retiré ~g~ "..total.." $ ~w~.", 'CHAR_BANK_FLEECA', 8)
    else
         TriggerClientEvent('rdx:showNotification', source, "Vous n'avez pas tout cette ~r~d\'argent !")
    end    
end)