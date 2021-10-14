function u = prod_perfil(AA,diag,v) 
%%%%%%%% Producto de matriz en formato perfil por un vector.
%%%%%%%% Autor: Adrián Sanjurjo García
%%%%%%%%
L = max(size(v));

u = zeros(size(v));

vec_aux = ones(size(v));       % Vector de indices a usar en la linea aux = aux + AA(diag(j) - vec_aux(j))*v(j);


for i = L:-1:1
    if i == 1           % Condicional para la última ejecución
        u(i) = AA(i)*v(i);
    else
        u(i) = dot(AA(diag(i-1) + 1:diag(i)), v(i - max(size(AA(diag(i-1) + 1:diag(i))))+1: i));
    end
    if i ~= L           % Condicional para todas las ejecuciones menos para la primera
        aux = 0;        % Reiniciamos el valor auxiliar
        for j = L:-1:i+1
            if abs(diag(j-1) - diag(j)) >= j+1-i          % Condicion para que multiplique el elemento de la columna de A
                aux = aux + AA(diag(j) - vec_aux(j))*v(j);
            end
            vec_aux(j) = vec_aux(j) + 1;
        end
        u(i) = u(i) + aux;
    end
end

end