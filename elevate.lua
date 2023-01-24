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

-- while true do
--     ylevel= sensor.sense()[1]["y"]
--     if math.floor(ylevel+0.5) == 0 then
--         piston.setOutput("up", true)
--         sleep(0.2)
--         piston.setOutput("up", false)
--     end
-- end