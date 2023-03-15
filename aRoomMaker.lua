
funcion clearTerm()
    term.clear()
    term.setCursorPos(1,1)
end

function moveForward(x)
    for i = 0,10 do
        while not turtle.forward() do 
            turtle.dig()
        end
    end
end

clear()
print("HELLO")
moveForward(5)
