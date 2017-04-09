AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/Humans/Group01/Male_01.mdl")	
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetSolid( SOLID_BBOX )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
end

function ENT:Use(ply)
	if IsValid(ply) and ply:IsPlayer() and ply:GetPos():Distance(self:GetPos()) <= 200 and cal:GetEyeTraceNoCursor().Entity == self then
		ply:SendLua('Entity('..self:EntIndex()..'):Use()')
	end
end
