//implement a phone's ringer or vibration motor. Based on input ring, turn on ringer or motor if the phone is in vibrate mode or not.

module top_module (
    input ring, vibrate_mode,
    output ringer, motor
);
    assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;
endmodule