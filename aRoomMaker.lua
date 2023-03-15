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
        while not turtle.up() do 
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
clearTerm()
print("HELLO")


moveUp(1)
mineForward(1)