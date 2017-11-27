AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

util.AddNetworkString("houseNPCMenu")
function ENT:Initialize()
	self:SetModel("models/Humans/Group01/Male_01.mdl")	
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetSolid( SOLID_BBOX )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
end

function ENT:AcceptInput(it, act, ply)
	if it == "Use" and (not self.nextUse or self.nextUse <= CurTime()) and IsValid(ply) and ply:IsPlayer() and ply:GetPos():Distance(self:GetPos()) <= 200 and ply:GetEyeTraceNoCursor().Entity == self then
		net.Start("houseNPCMenu")
		net.Send(ply)
		self.nextUse = CurTime() + 1
	end
end
