ESX = nil


------------- MERCI D4AVOIR INSTALLER MON TEMPLATE POUR TOUTE QUESTIONS VENEZ SUR DISCORD FAITE UN TICKET OU MP 

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
  end)

  
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


stockdracarys = { -- NOM A CHANGER ICI ET AU CREATEMENU SI VOUS LE SOUHAITEZ CELA N'EST PAS OBLIGATOIRE ^^
  Base = {Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}}, 
  Data = {currentMenu = "Stock :"}, 
  Events = {
      onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)


        ---- TOUT LES ELSEIF ET LES IF ICI
         
      end,
          },
  Menu = {
      ["Stock :"] = {
          b = {
            {name = "Action Coffre", ask = ">", askX = true},
            {name = "~r~Fermer le menu", ask = ">", askX = true},           
          }
      },
      ["Action Coffre"] = { 
          b = {
            {name = "Déposer objets", ask = ">", askX = true},
            {name = "Retirer objets", ask = ">", askX = true}

          } 
      },
      ["Déposer des objets"] = { 
        b = {  
         } 
     },

    ["Retirer un objet"] = {
         b = {
         } 
      },
  }
}


local pos = { 
{x = 229.85,   y = -759.07,  z = 30.83}, ----- LA POS DU MENU

}

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)

      for k in pairs(pos) do

          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
          if dist <= 2.0 then
     DrawMarker(6, 229.85, -759.07, 29.83, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 247, 125, 125, 100) ----- LA POSE DU MARKER (POINT)
         else
             Citizen.Wait(500)
      end 
          if dist <= 1.0 then
              ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder ~g~au Coffre.") ------------ La Notification 
       if IsControlJustPressed(1,51)  then        -------------- LA TOUCHE DU MENU
        print('^^DRACARYS ')
                  CreateMenu(stockdracarys) 
      end
          end
      end
  end  
end)
