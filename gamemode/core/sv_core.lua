local difficulty = 1
function GM:SetDifficulty(diff)
	difficulty = diff
end

function GM:GetDifficulty()
	return difficulty
end

concommand.Add("boiguhs_setdifficulty", function(ply,cmd,args)
	if(!ply:IsAdmin() or args[1] == nil) then return end
	if(tonumber(args[1]) > 4 or tonumber(args[1]) < 0) then 
		print("Invalid difficulty!")
		return
	end
	
	GAMEMODE:SetDifficulty(tonumber(args[1]))
	ply:ConCommand("boiguhs_getdifficulty")
end)

concommand.Add("boiguhs_getdifficulty", function(ply,cmd,args)
	if(!ply:IsAdmin()) then return end
	local difficulties = {"Easy","Normal","Hard"}
	
	print("Boiguhs difficulty set to: "..difficulties[difficulty])
end)

local morale = 4
function GM:SetMorale(num)
	morale = num
end

function GM:AddMorale(num)
	morale = math.Clamp(morale + num, 4, 20)
end

function GM:SubtractMorale(num)
	morale = math.Clamp(morale - num, 4, 20)
end

function GM:GetMorale()
	return morale
end

concommand.Add("boiguhs_setmorale", function(ply,cmd,args)
	if(!ply:IsAdmin() or args[1] == nil) then return end
	
	GAMEMODE:SetMorale(args[1])
end)

local money = 0
function GM:SetMoney(num)
	money = num
end

function GM:AddMoney(num)
	money = money + num
end

function GM:SubtractMoney(num)
	money = money - num
end

function GM:GetMoney()
	return money
end

concommand.Add("boiguhs_setmoney", function(ply,cmd,args)
	if(!ply:IsAdmin() or tonumber(args[1]) == nil) then return end
	
	GAMEMODE:SetMoney(args[1])
end)

local qdebug = 0
function GM:SetDebug(num)
	qdebug = num
end

function GM:Debug()
	return qdebug
end

concommand.Add("boiguhs_debug", function(ply,cmd,args)
	if(!ply:IsAdmin() or args[1] == nil) then return end
	if(tonumber(args[1]) > 1 or tonumber(args[1]) < 0) then
		print("Invalid input!")
		return
	end
	
	GAMEMODE:SetDebug(tonumber(args[1]))
end)

function GM:CallTruck()
	local cost = 40+(GAMEMODE:GetDifficulty()*10)
	if(GAMEMODE:GetMoney() > cost) then
		GAMEMODE:SubtractMoney(cost)
		timer.Simple(5, function()
			ents.FindByClass("ai_truckspawn")[1]:SpawnTruck()
		end)
	end
end

local started = false
function GM:GameStarted()
	return started
end

function GM:StartGame()
	if started then return false end
	started = true
	
	timer.Simple(0.1, function() game.CleanUpMap() 

	PrintMessage(HUD_PRINTCENTER, "Boiguhs has started! You have 30 seconds to prepare!")
	
		
	timer.UnPause("SpawnBoiguhCustomer")
	timer.UnPause("SpawnBoiguhCar")

	local num1 = (math.random(60,120)/GAMEMODE:GetDifficulty())
	local num2 = 600
	
	if(GAMEMODE:GetDifficulty() == 3) then num2 = 300 end
	timer.Create("boiguhs_rat",     num1,0,function() SpawnARat()     end)
	timer.Create("boiguhs_ratswarm",num2,0,function() SpawnRatSwarm() end)
	end)
end

function SpawnARat()
	local rat = ents.Create("boiguhs_rat")
	rat:SetPos(Vector(0,0,-60))
	rat:Spawn()
		
	timer.Simple(25,function() 
		if IsValid(rat) then rat:Remove() end 
	end)
end

function SpawnRatSwarm()
	local rat = ents.Create("boiguhs_rat")
	rat:SetPos(Vector(0,0,-60))
	rat:Spawn()
	
	local rat2 = ents.Create("boiguhs_rat")
	rat2:SetPos(Vector(0,0,-60))
	rat2:Spawn()
	
	local rat3 = ents.Create("boiguhs_rat")
	rat3:SetPos(Vector(0,0,-60))
	rat3:Spawn()
	
	local rat4 = ents.Create("boiguhs_rat")
	rat4:SetPos(Vector(0,0,-60))
	rat4:Spawn()
	
	local rat5 = ents.Create("boiguhs_rat")
	rat5:SetPos(Vector(0,0,-60))
	rat5:Spawn()
	
	local rat6 = ents.Create("boiguhs_rat")
	rat6:SetPos(Vector(0,0,-60))
	rat6:Spawn()
	
	local rat7 = ents.Create("boiguhs_rat")
	rat7:SetPos(Vector(0,0,-60))
	rat7:Spawn()
	
	local rat8 = ents.Create("boiguhs_rat")
	rat8:SetPos(Vector(0,0,-60))
	rat8:Spawn()
	
	local rat9 = ents.Create("boiguhs_rat")
	rat9:SetPos(Vector(0,0,-60))
	rat9:Spawn()
	
	local rat10 = ents.Create("boiguhs_rat")
	rat10:SetPos(Vector(0,0,-60))
	rat10:Spawn()
			
	timer.Simple(25,function() 
		if IsValid(rat)   then rat:Remove()   end 
		if IsValid(rat2)  then rat2:Remove()  end 
		if IsValid(rat3)  then rat3:Remove()  end 
		if IsValid(rat4)  then rat4:Remove()  end 
		if IsValid(rat5)  then rat5:Remove()  end 
		if IsValid(rat6)  then rat6:Remove()  end 
		if IsValid(rat7)  then rat7:Remove()  end 
		if IsValid(rat8)  then rat8:Remove()  end 
		if IsValid(rat9)  then rat9:Remove()  end 
		if IsValid(rat10) then rat10:Remove() end 
	end)
end