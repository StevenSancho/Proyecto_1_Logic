module bin_to_led(
    input logic [3:0] bin_in, // Entrada binaria 
    output logic [3:0] leds   //Salida a los LEDs
);

// Asignacion directa de binario a los leds
    assign leds = bin_in;
endmodule 