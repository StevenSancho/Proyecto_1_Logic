module gray_to_binary(
    // Entrada gray y salida binario
    input logic [3:0] gray_in,
    output logic [3:0] binario_out
);

    // Función para convertir código Gray a binario
    function logic [3:0] gray_to_binary(input logic [3:0] gray);
        logic [3:0] binario;
        
        // MSB del código Gray es igual al del código binario
        binario[3] = gray[3];

        // binario[2] 
        binario[2] = (gray[3] & ~(gray[2])) | (~(gray[3]) & gray[2]);

        // binario[1]
        binario[1] = (~(binario[2]) & gray[1]) | ((binario[2]) & ~(gray[1]));

        // binario[0]
        binario[0] = (binario[1] & ~(gray[0])) | (~(binario[1]) & gray[0]);

        return binario;
    endfunction

    // Bloque combinacional para llamar a la función y asignar el resultado
    always_comb begin
        binario_out = gray_to_binary(gray_in);
    end
endmodule


