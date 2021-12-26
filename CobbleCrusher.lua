
-- go to chest
function goToChest(chest)
  if chest == 1 then
    turtle.turnLeft()
  elseif chest == 2 then
    turtle.turnRight()
  end
end

while true 
do

    craftArray = {1,2,3,5,6,7,9,10,11}
    -- fill crafter
    for i = 1, 9 do
        turtle.select(craftArray[i])
      
        while(true) do             
            if(turtle.suck()) then
                -- if sucked item was not cobble, put in chest above
                if(turtle.getItemDetail() ~= nil)
                then
                
                    if(turtle.getIdemDetail().name ~= "minecraft:cobblestone")
                    then
                        turtle.dropUp()
                    else
                        -- if it was cobble and 64 move on
                        if(turtle.getItemCount() == 64)
                        then
                            break
                        elseif(turtle.getItemCount() > 0)
                        then
                            -- if it was less than 64, try again
                            turtle.drop()
                        end
                        print("Waiting for cobble")
                        -- nothing was sucked, try again
                    end
                end
            end
        end           
    end

    -- craft
    turtle.craft(64)

    -- deposit
    goToChest(2)
    for i = 1, 3 do
        turtle.select(i)
        turtle.drop()
    end
    for i = 5, 7 do
        turtle.select(i)
        turtle.drop()
    end
    for i = 9, 11 do
        turtle.select(i)
        turtle.drop()
    end

    -- go to chest 1
    goToChest(1)
end
