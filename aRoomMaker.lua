--Version 1.1.4
roomWidth = 9
roomLenght = 4
roomHeight = 6
turtleY = 1

function clearTerm()
    term.clear()
    term.setCursorPos(1,1)
end

function digUp()
    while turtle.detectUp() do 
        turtle.digUp()
    end
end
function dig()
    while turtle.detect() do 
        turtle.dig()
    end
end
function digDown()
    while turtle.detectDown() do 
        turtle.digDown()
    end
end
function moveForward(x)
    for i = 1,x do
        while not turtle.forward() do 
            dig()
        end
    end
end
function moveUp(x)
    for i = 1,x do
        while not turtle.up() do 
            digUp()
        end
        turtleY = turtleY + 1
    end
end
function moveDown(x)
    for i = 1,x do
        while not turtle.down() do 
            digDown()
        end
        turtleY = turtleY - 1
    end
end
function turnRight()
    turtle.turnRight()
end
function turnLeft()
    turtle.turnLeft()
end
function turnAround()
    turnRight()
    turnRight()
end
function mineForward(x)
    for i = 1,x do
        while not turtle.forward() do 
            dig()
        end
        digUp()
        digDown()
    end
end

function mineDoor()
    moveForward(1)
    turnLeft()
    for i=1,2 do
        dig()
        moveUp(1)
    end
    dig()
    turnAround()
    for i 1,2 do
        dig()
        moveDown(1)
    end
    dig()
    turnLeft()
end

distiance = math.floor(roomWidth/2)
rowLenght = roomLenght -1

clearTerm()
print("HELLO")

mineDoor()

--Get to First Row
moveUp(1)
mineForward(1)
turnLeft()
mineForward(distiance)
turnRight()

numOfMineingLevels = roomHeight/3
---clear Row
for i = 1, numOfMineingLevels do
    for i = 1,roomWidth do
        print("Row " , i)
        mineForward(rowLenght)
        if i == roomWidth then
            --moveDown(1)
            --turnLeft()
            --moveForward(distiance)
            --turnRight()
            
        elseif (i % 2 == 0) then
            turnLeft()
            mineForward(1)
            turnLeft()
            
        else
            turnRight()
            mineForward(1)
            turnRight()
            
        end
    end
    if i != numOfMineingLevels then
        turnAround()
        moveUp(3)
end

moveDown(3*numOfMineingLevels)