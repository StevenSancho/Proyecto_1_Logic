module bin_to_led(
    input logic [3:0] bin_in, // Entrada binaria 
    output logic [3:0] led   //Salida a los LEDs
);

// Asignacion directa de binario a los leds
    assign led = bin_in;
endmodule 