
nome = 'Francis';

try
    % Cria o objeto Bluetooth
    bt = Bluetooth(nome, 1);
    fopen(bt);  % Abre a conexão
    disp('Conexão Bluetooth estabelecida com sucesso.');
    
    write(bt,'st','string');
    % Loop de recebimento de dados
    while true
        if bt.BytesAvailable > 0
            data = fread(bt, bt.BytesAvailable, 'char');
            disp(['Dados recebidos: ', char(data')]);
        end
        pause(0.1);
    end
    
catch ME
    disp(['Erro: ', ME.message]);
    
finally
    % Fecha a conexão ao terminar
    if exist('bt', 'var') && strcmp(bt.Status, 'open')
        fclose(bt);
        delete(bt);
        disp('Conexão Bluetooth encerrada.');
    end
end
