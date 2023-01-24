local floorsetup = {
    {"manipulator_0", "redstone_integrator_0"},
    {"manipulator_1", "redstone_integrator_1"}
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
        sensed = floors[targetfloor][1].sense()
        if #sensed > 0 then
            ylevel = sensed[1]["y"]
        end
        if math.floor(ylevel+0.5) == 0 then
        floors[targetfloor][2].setOutput("up", true)
        sleep(0.2)
        floors[targetfloor][2].setOutput("up", false)
        break
        end
    end
end