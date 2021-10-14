clear all

% Comprobar tener el programa llena2perfil.m en el mismo directorio.

A = [ 3 0 -1 0 0 ; 0 1 0 0 1 ; -1 0 3 0 0 ; 0 0 0 5 0 ; 0 1 0 0 8];
[AA, diag] = llena2perfil(A);

v = [1; -3; 2; 1; 0];

fprintf('Resultado del producto en formato perfil')
u = prod_perfil(AA,diag,v)

% Comparando con el producto en versión normal
A*v