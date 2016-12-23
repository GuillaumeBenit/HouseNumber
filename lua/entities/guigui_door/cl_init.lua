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

function ENT:Use(ent)
	local Frame=vgui.Create("DFrame")
	Frame:SetTitle("Houses register")
	Frame:SetSize(500,600)
	Frame:Center()
	Frame:MakePopup()
	Frame:ShowCloseButton(true)
	Frame.Paint=function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,150))
	end

	local List_1=vgui.Create("DListView",Frame)
	List_1:SetPos(50,50)
	List_1:SetSize(400,500)
	List_1:SetMultiSelect(false)
	List_1:AddColumn("Name")
	List_1:AddColumn("ID")
	for k,v in pairs(player.GetAll()) do
		List_1:AddLine(v:Nick(),string.Explode(",",string.Comma(v:SteamID64()),false)[6]..string.Explode(",",string.Comma(v:SteamID64()),false)[1])
	end
end

function ENT:Draw()
	self:DrawModel()
	local Pos=self:GetPos()
	local EntAng=self:GetAngles()
	local TextAng=Angle()
	TextAng:Set(EntAng)
	TextAng:RotateAroundAxis(EntAng:Up(),90)
	TextAng:RotateAroundAxis(EntAng:Right(),-90)
	cam.Start3D2D(Pos+(EntAng:Forward()*Vector(0,0,50).x)+(EntAng:Right()*Vector(0,0,50).y)+(EntAng:Up()*Vector(0,0,75).z),TextAng,0.2)
	local text="Houses register"
	surface.SetFont("guigui_door_npc_Name")
	local textWidth,textHeight= surface.GetTextSize(text)
	draw.WordBox(0,-textWidth/2,-textHeight/2,text,"guigui_door_npc_Name",Color(255,255,255,0),Color(225,225,225,255))
	cam.End3D2D()
end