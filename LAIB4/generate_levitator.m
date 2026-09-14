% Script per creare automaticamente il modello Simulink del levitatore magnetico

% Apri Simulink
open_system(new_system('LevitatorModel'));

% Parametri
Km = 1.52e-4;  % Nm^2/A^2
m = 0.02;       % kg
g = 9.81;       % m/s^2
Kt = 708.27;    % V/m

% Aggiungi blocchi
add_block('simulink/Sources/Constant', 'LevitatorModel/I_m', 'Position', [50, 50, 80, 70], 'Value', '0.8');
add_block('simulink/Continuous/Integrator', 'LevitatorModel/Integrator1', 'Position', [150, 50, 180, 70]);
add_block('simulink/Continuous/Integrator', 'LevitatorModel/Integrator2', 'Position', [250, 50, 280, 70]);
add_block('simulink/Math Operations/Product', 'LevitatorModel/Square_I', 'Position', [50, 150, 100, 180]);
add_block('simulink/Math Operations/Product', 'LevitatorModel/Square_x1', 'Position', [250, 150, 300, 180]);
add_block('simulink/Math Operations/Divide', 'LevitatorModel/Division', 'Position', [350, 150, 400, 180]);
add_block('simulink/Math Operations/Gain', 'LevitatorModel/Km_gain', 'Position', [150, 150, 200, 180], 'Gain', num2str(Km/m));
add_block('simulink/Math Operations/Gain', 'LevitatorModel/Negate', 'Position', [450, 150, 500, 180], 'Gain', '-1');
add_block('simulink/Math Operations/Sum', 'LevitatorModel/Sum', 'Position', [550, 150, 600, 180], 'Inputs', '|+-');
add_block('simulink/Sinks/Scope', 'LevitatorModel/Scope', 'Position', [650, 50, 680, 70]);

% Collegamenti
add_line('LevitatorModel', 'I_m/1', 'Square_I/1');
add_line('LevitatorModel', 'Square_I/1', 'Km_gain/1');
add_line('LevitatorModel', 'Integrator1/1', 'Square_x1/1');
add_line('LevitatorModel', 'Square_x1/1', 'Division/2');
add_line('LevitatorModel', 'Km_gain/1', 'Division/1');
add_line('LevitatorModel', 'Division/1', 'Negate/1');
add_line('LevitatorModel', 'Negate/1', 'Sum/1');
add_line('LevitatorModel', 'Sum/1', 'Integrator2/1');
add_line('LevitatorModel', 'Integrator2/1', 'Integrator1/1');
add_line('LevitatorModel', 'Integrator1/1', 'Scope/1');

% Salva il modello
save_system('LevitatorModel');
disp('Modello Simulink generato con successo!');
