local sensor = peripheral.wrap("manipulator_0")
local piston = peripheral.wrap("redstone_integrator_0")
ylevel = 0
while true do
    ylevel= sensor.sense()[1]["y"]
    if math.floor(ylevel+0.5) == 0 then
        piston.setOutput("up", true)
        sleep(0.2)
        piston.setOutput("up", false)
    end
end