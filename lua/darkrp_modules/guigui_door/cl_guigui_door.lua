
surface.CreateFont("guigui_door_font",{
    font="DermaLarge",
    size=25,
    antialias=false,
})

local matDoor = Material("guigui/door/plate.png","unlitgeneric smooth")

local function guigui_door(door)
    if door:isKeysOwned() then
        local ang = door:GetAngles()
        local GetID = string.Explode(",",string.Comma(door:getDoorOwner():SteamID64()),false)
        local ID= GetID[6].. GetID[1]
        cam.Start3D()
            ang:RotateAroundAxis(ang:Right(),-90)
            ang:RotateAroundAxis(ang:Up(),90)
            cam.Start3D2D(door:LocalToWorld(Vector(0,3.5,50)),ang,0.1)
                surface.SetMaterial(matDoor)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(0,0,65,35)
                surface.SetTextPos(5,5)
                surface.SetFont("guigui_door_font") 
                surface.DrawText(ID)
            cam.End3D2D()
            ang:RotateAroundAxis(ang:Right(),180)
            cam.Start3D2D(door:LocalToWorld(Vector(0,3.5+6.75,50)),ang, 0.1 )
                surface.SetMaterial(matDoor)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(0,0,65,35)
                surface.SetTextPos(5,5)
                surface.SetFont("guigui_door_font") 
                surface.DrawText(ID)
            cam.End3D2D()
        cam.End3D()
        return true
    end
end
hook.Add("HUDDrawDoorData","guigui_door", guigui_door)
