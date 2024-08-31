/*module gray_decoder_system(
    input logic [3:0] gray_in, // Entrada codigo gray
    output logic [3:0] led, // Salida a los leds de la FPGA
    output logic [6:0] seg // SAlida al 7 segmentos 
);

    //Señal interna para la salida binaria del subsistema 
    logic [3:0] bin_out;

    gray_to_binary gray_to_binary_inst (
        .gray_in(gray_in),
        .binario_out(bin_out)
    );

    bin_to_led bin_to_led_inst (
        .bin_in(bin_out),
        .led(led)
    );

    bin_to_7seg bin_to_7seg_inst(
        .bin_in(bin_out),
        .seg(seg)
    );
endmodule*/

module gray_decoder_system(
    input logic [3:0] gray_in,  // Entrada codigo gray
    output logic [3:0] led,     // Salida a los LEDs de la FPGA
    output logic [6:0] seg,     // Salida común a ambos displays
    output logic [1:0] an       // Anodos para seleccionar el display
);

    // Señal interna para la salida binaria del subsistema 
    logic [3:0] bin_out;

    // Instanciar el módulo que convierte Gray a binario
    gray_to_binary gray_to_binary_inst (
        .gray_in(gray_in),
        .binario_out(bin_out)
    );

    // Instanciar el módulo que controla los LEDs
    bin_to_led bin_to_led_inst (
        .bin_in(bin_out),
        .led(led)
    );

    // Instanciar el módulo que controla los displays de 7 segmentos y los anodos
    bin_to_7seg bin_to_7seg_inst (
        .bin_in(bin_out),
        .seg(seg),
        .an(an)
    );

endmodule
