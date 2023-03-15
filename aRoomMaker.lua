term.clear()
print("Welcome the the Room Builder")


function moveForward(x)
    for i = 0,10 do
        while not turtle.forward() do 
            turtle.dig()
        end
    end
end

moveForward(5)
