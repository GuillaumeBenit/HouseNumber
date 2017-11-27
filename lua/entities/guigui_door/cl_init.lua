include("shared.lua")

surface.CreateFont("guigui_door_npc",{
	font="Arial",
	size=32,
	antialias=true,
})
surface.CreateFont("guigui_door_npc_Name",{
	font="Arial",
	size=32,
	antialias=true,
})

local function houseNPCMenu()
	local Frame = vgui.Create("DFrame")
	Frame:SetTitle("Houses register")
	Frame:SetSize(500,600)
	Frame:Center()
	Frame:MakePopup()
	Frame.Paint=function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,150))
	end

	local List_1 = vgui.Create("DListView",Frame)
	List_1:SetPos(50,50)
	List_1:SetSize(400,500)
	List_1:SetMultiSelect(false)
	List_1:AddColumn("Name")
	List_1:AddColumn("ID")
	for k,v in pairs(player.GetAll()) do
		List_1:AddLine(v:Nick(),string.Explode(",",string.Comma(v:SteamID64()),false)[6]..string.Explode(",",string.Comma(v:SteamID64()),false)[1])
	end
end
net.Receive("houseNPCMenu", houseNPCMenu)

local text = "Houses register"
local invisible = Color(255,255,255,0)
function ENT:Draw()
	self:DrawModel()
	local pos, ang, ply = self:GetPos(), self:GetAngles(), LocalPlayer()

	if not IsValid(ply) or not ply:Alive() or ply:GetPos():Distance(self:GetPos()) <= 50 then return end
	ang:RotateAroundAxis( ang:Up(), 90 )
	ang:RotateAroundAxis( ang:Forward(), 90 )

	cam.Start3D2D(pos + ang:Right() * - 75 + ang:Forward() * - 0.5, ang, 0.1)
		draw.SimpleText(text, "guigui_door_npc_Name", 0, 0, color_white, 1, 1)
	cam.End3D2D()
end
