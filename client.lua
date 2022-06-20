addEventHandler("onClientVehicleStartExit",root,function(oyuncu,koltuk,jacked)
    if koltuk > 0 then return end
    if oyuncu ~= localPlayer then return end
    rx,ry,rz = getVehicleComponentRotation(source,"wheel_rf_dummy")
end)
addEventHandler("onClientElementDataChange",root,function(name,old,new)
    if name ~= "teker.rz" then return end
    if getElementType(source) ~= "vehicle" then return end
    if not isElementStreamedIn(source) then return end
    local ped = getVehicleController(source)
    if getElementType(ped) ~= "ped" then return end
    local maxx = (new > 0 and new < 22) and 20 or (360) 
    setPedAnalogControlState(ped,"vehicle_"..(maxx == 20 and "left" or "right"),(new*1)/maxx)
end)
addEventHandler("onClientElementStreamIn",root,function()
    if getElementType(source) ~= "vehicle" then return end
    local new = getElementData(source,"teker.rz")
    if not new then return end
    local ped = getVehicleController(source)
    if getElementType(ped) ~= "ped" then return end
    local maxx = (new > 0 and new < 22) and 20 or (360) 
    setPedAnalogControlState(ped,"vehicle_"..(maxx == 20 and "left" or "right"),(new*1)/maxx)
end)
addEventHandler("onClientPlayerVehicleExit", localPlayer,function (arac, koltuk)
    if koltuk > 0 then return end
    triggerServerEvent("teker.ped",resourceRoot,arac,rz)
end)