--Version 1.0.7
width = 5
lenght = 5
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
    end
end
function moveDown(x)
    for i = 1,x do
        while not turtle.down() do 
            digDown()
        end
    end
end
function turnRight()
    turtle.turnRight()
end
function turnLeft()
    turtle.turnLeft()
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

distiance = math.floor(width/2)

width 
lenght = lenght -1
clearTerm()
print("HELLO")



moveForward(1)
turnLeft()
dig()
moveUp(1)
dig()
moveUp(1)
dig()
turnRight()
turnRight()
dig()
moveDown(1)
dig()
moveDown(1)
dig()
turnLeft()
moveUp(1)
mineForward(1)
turnLeft()
mineForward(distiance)
turnRight()


for i = 1,width do
    print("Row " , i)
    mineForward(lenght)
    if i == width then
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