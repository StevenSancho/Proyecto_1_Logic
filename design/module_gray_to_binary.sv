module gray_to_binary(
    // Entrada gray y salida binario
    input logic [3:0] gray_in,
    output logic [3:0] binario_out
);

    // Asignaciones continuas para convertir Gray a binario
    assign binario_out[3] = gray_in[3];
    assign binario_out[2] = (gray_in[3] & ~(gray_in[2])) | (~(gray_in[3]) & gray_in[2]);
    assign binario_out[1] = (~(binario_out[2]) & gray_in[1]) | ((binario_out[2]) & ~(gray_in[1]));
    assign binario_out[0] = (binario_out[1] & ~(gray_in[0])) | (~(binario_out[1]) & gray_in[0]);

endmodule




