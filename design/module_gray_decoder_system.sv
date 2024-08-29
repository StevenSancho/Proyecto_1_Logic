module gray_decoder_system(
    input logic [3:0] gray_in, // Entrada codigo gray
    output logic [3:0] leds, // Salida a los leds de la FPGA
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
        .leds(leds)
    );

    bin_to_7seg bin_to_7seg_inst(
        .bin_in(bin_out),
        .seg(seg)
    );
endmodule