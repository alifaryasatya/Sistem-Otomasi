% Definisi simbolik
syms V I R L Kb Kt J B omega Tm s

% 1. Model Matematika Motor DC
% Persamaan listrik (Hukum Kirchoff)
eq1 = V == R*I + L*diff(I, 't') + Kb*omega;

% Persamaan mekanik (Dinamika Rotasi)
eq2 = J*diff(omega, 't') + B*omega == Kt*I - Tm;

% 2. Transformasi Laplace
I_s = sym('I_s');
Omega_s = sym('Omega_s');
eq1_s = subs(eq1, {I, diff(I, 't')}, {I_s, s*I_s});
eq2_s = subs(eq2, {omega, diff(omega, 't')}, {Omega_s, s*Omega_s});

% 3. Fungsi Alih (Omega(s) / V(s))
I_s_expr = solve(eq1_s, I_s);
Omega_s_expr = solve(subs(eq2_s, I_s, I_s_expr), Omega_s);
G_s = simplify(Omega_s_expr / V);

% Menampilkan hasil
disp('Persamaan Listrik:');
disp(eq1);
disp('Persamaan Mekanik:');
disp(eq2);
disp('Transformasi Laplace - Persamaan Listrik:');
disp(eq1_s);
disp('Transformasi Laplace - Persamaan Mekanik:');
disp(eq2_s);
disp('Fungsi Alih G(s) = Omega(s) / V(s):');
disp(G_s);
