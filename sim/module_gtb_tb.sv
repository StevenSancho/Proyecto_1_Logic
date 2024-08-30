`timescale 1ns / 1ps

module gray_to_bin_dec;

    // Señales de testbench
    logic [3:0] gray_in;
    logic [3:0] bin_out;
    logic [3:0] leds;
    logic [6:0] seg;

    // Instanciación de los módulos
    gray_to_binary DUT_gray (
        .gray_in(gray_in),
        .binario_out(bin_out)
    );

    bin_to_led DUT_led (
        .bin_in(bin_out),
        .leds(leds)
    );

    bin_to_7seg DUT_seg (
        .bin_in(bin_out),
        .seg(seg)
    );

    // Generación de estímulos
    initial begin
        // Inicializar
        $display("Iniciando con el código gray");
        gray_in = 4'b0000; // Comienza con el valor de Gray 0

        // Probar todas las combinaciones de Gray
        for (int i = 0; i < 16; i++) begin
            gray_in = i[3:0];
            #20; // Esperar para observar el resultado
        end

        // Finalizar la simulación
        $display("Terminando simulación");
        $finish;
    end

    // Monitoreo de resultados
    initial begin
        $monitor("Tiempo: %0dns, Gray: %b, Binario: %b, LEDs: %b, 7Seg: %b", 
                 $time, gray_in, bin_out, leds, seg);
    end

    // Generación de archivo VCD para visualización de formas de onda
    initial begin
        $dumpfile("Resultados.vcd");
        $dumpvars(0, gray_to_bin_dec);
    end

endmodule