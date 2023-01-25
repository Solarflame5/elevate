local floorsetup = {
    {"manipulator_41", "redstone_integrator_193"},
    {"manipulator_42", "redstone_integrator_195"}
}

local floors = {}

for i=1,#floorsetup do
    floors[i] = {}
    floors[i][1] = peripheral.wrap(floorsetup[i][1])
    floors[i][2] = peripheral.wrap(floorsetup[i][2])
end

for i=1,#floors do
    print(floors[i][1])
    print(floors[i][2])
end

local targetfloor
local ylevel
local sensed

while true do
    write("Enter destination floor: ")
    targetfloor = io.read()
    targetfloor = tonumber(targetfloor)
    while true do
        local suc = false
        sensed = floors[targetfloor][1].sense()
        for i, entity in ipairs(sensed) do
            if entity.key == "minecraft:player" then
                if #sensed > 0 then
                    ylevel = sensed[i]["y"]
                end
                if math.floor(ylevel+0.5) == 0 then
                    floors[targetfloor][2].setOutput("up", true)
                    sleep(0.2)
                    floors[targetfloor][2].setOutput("up", false)
                    suc = true
                    break
                end
            end
        end
        if suc then
            break
        else
            sleep(0.1)
        end
    end
end
