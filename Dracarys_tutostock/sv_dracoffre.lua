ESX = nil

----------------- DRACARYS ----------

------------ COTER SERVEUR DEJA FAIT BY DRACARYS
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('dracarys:getStockItems')
AddEventHandler('dracarys:getStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', "society_cardealer", function(inventory) -------- SOCIETY A CHANGER CELON VOTRE JOB
		local item = inventory.getItem(itemName)
		if item.count >= tonumber(count) then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~La quantité et invalid') ----- Notification
		end
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré | ~b~' .. count .. '~s~ | ~b~' .. item.label) ----- Notification
	end)
end)

ESX.RegisterServerCallback('dracarys:getinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	cb({
		items = items
	})
end)

RegisterServerEvent('dracarys:putStockItem')
AddEventHandler('dracarys:putStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', "society_cardealer", function(inventory) -------- SOCIETY A CHANGER CELON VOTRE JOB
		local item = inventory.getItem(itemName)
		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté | ~b~' .. count .. '~s~ | ~b~' .. item.label)----- Notification
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~La quantité et invalid')
		end
		
	end)
end)

ESX.RegisterServerCallback('Dracarys:getStockItem', function(source, cb) 
    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory) -------- SOCIETY A CHANGER CELON VOTRE JOB
        cb(inventory.items) 
    end)     
end)       










