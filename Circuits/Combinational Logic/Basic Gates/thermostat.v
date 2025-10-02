//implement a thermostat that turns on a heater/cooler and fan when appropriate.
//inputs: too_cold, too_hot, mode, fan_on
//outputs: heater, aircon, fan
//define mode=1 as heating, mode=0 as cooling

module top_module (
    input too_cold, too_hot, mode, fan_on,
    output heater, aircon, fan
);
    assign heater = too_cold & mode;
    assign aircon = too_hot & ~mode;
    assign fan = fan_on | (too_cold & mode) | (too_hot & ~mode);
endmodule