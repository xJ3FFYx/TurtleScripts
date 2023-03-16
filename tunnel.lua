local tArgs = {...}
 
local length = tArgs[1]
 
local blocksMined = 0
local startFuel = turtle.getFuelLevel()
local fuelUsed
local fuelPercent
function clearTerm()
 
    term.clear()
    term.setCursorPos(1,1)
end
 
function stats()
    fuelUsed = startFuel - turtle.getFuelLevel()
    fuelPercent = turtle.getFuelLevel() / turtle.getFuelLimit()
    fuelPercent = fuelPercent * 100
    clearTerm()
    term.write("TURTLE STATS")
    term.setCursorPos(1,2)
    term.write("********************************************************************************************")
    term.setCursorPos(1,4)
    term.write("Fuel Level: ".. turtle.getFuelLevel())
    term.setCursorPos(1,5)
    term.write("Fuel is at ".. fuelPercent.. "%")
    term.setCursorPos(1,6)
    term.write("Total Fuel Used :".. fuelUsed)
    term.setCursorPos(1,7)
    term.write("Blocks Mined :".. blocksMined)
end
 
function checkFuel()
    if turtle.getFuelLevel() < 9 * length then
        return false
    else
        return true
    end
end
--dig Functions
function dig()
    while turtle.detect() do
        if turtle.dig() then
            blocksMined = blocksMined + 1
            stats()
        end
    end
end
function digUp()
    while turtle.detectUp() do
        if turtle.digUp() then
            blocksMined = blocksMined + 1
            stats()
        end
    end
end
function digDown()
    while turtle.detectDown() do
        if turtle.digDown() then
            blocksMined = blocksMined + 1
            stats()
        end
    end
end
--Turn Functions
function turnRight()
    turtle.turnRight()
end
function turnLeft()
    turtle.turnLeft()
end
--movement
function forward(x)
    if x == nil then
        x = 1
    end
   
    for i = 1, x do
        while not turtle.forward() do
            dig()
        end
    end
    stats()
end
function back(x)
if x == nil then
        x = 1
    end
   
    for i = 1, x do
        while not turtle.back() do
           
        end
    end
    stats()
end
function up(x)
    if x==nil then
        x=1
    end
   
    while not turtle.up() do
        digUp()
    end
    stats()
end
function down(x)
 
    if x==nil then
        x=1
    end
   
    while not turtle.down() do
        digDown()
    end
    stats()
end
function place()
	if turtle.getItemCount() == 0 then
		clearTerm()
		print("I need more Blocks to Place")
		while turtle.getItemCount() == 0 do
			sleep(1)
		end
		
	end
	turtle.place()
end
function placeUp()
	if turtle.getItemCount() == 0 then
		clearTerm()
		print("I need more Blocks to Place")
		while turtle.getItemCount() == 0 do
			sleep(1)
		end
	end
	turtle.placeUp()
end
function placeDown()
	if turtle.getItemCount() == 0 then
		clearTerm()
		print("I need more Blocks to Place")
		while turtle.getItemCount() == 0 do
			sleep(1)
		end
	end
	turtle.placeDown()
end



function tunnelSection()
   forward()
   placeDown()
   turnLeft()
   forward()
   placeDown()
   place()
   up()
   place()
   up()
   place()
   placeUp()
   turnLeft()
   turnLeft()
   forward()
   placeUp()
   digDown()
   forward()
   placeUp()
   place()
   down()
   place()
   down()
   place()
   placeDown()
   turnLeft()
   turnLeft()
   forward()
   turnRight()
end
 
 
--Main Program
 
if length == nil then
    print("error no Arguments")

elseif checkFuel() then

    for i = 1, length do
        tunnelSection()
    end
else
    print("not enough Fuel! ".. startFuel.. "/".. length * 9)
end