local teker = {}
addEvent("teker.ped",true)
addEventHandler("teker.ped",root,function(arac,rz)
    local x,y,z = getElementPosition(arac)
    if isElement(teker[arac]) then destroyElement(teker[arac]) end
    local ped = createPed(0,x,y,z)
    warpPedIntoVehicle(ped,arac,0)setElementAlpha(ped,0)
    teker[arac] = ped
    setElementData(arac,"teker.rz",rz)
end)
addEventHandler("onVehicleStartEnter",root,function()
    if isElement(teker[source]) then destroyElement(teker[source]) end
end)
addEventHandler("onElementDestroy",root,function()
    if isElement(teker[source]) then destroyElement(teker[source]) end
end)