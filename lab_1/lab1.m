%
% SF1900 - Probability Theory and Statistics 
% LAB 1 Simulation
%

%%
% Problem 0 - Computing probabilities


% P(Xk ≤ 3)
fprintf('P(X₁ ≤ 3) = %d\n', binocdf(3, 10, 0.3))
fprintf('P(X₂ ≤ 3) = %d\n', normcdf(3, 5, 3))
fprintf('P(X₃ ≤ 3) = %d\n', expcdf(3, 7))

% P(Xk > 7) = 1 - P(Xk ≤ 7)
fprintf('1 - P(X₁ ≤ 7) = %d\n', 1 - binocdf(7, 10, 0.3))
fprintf('1 - P(X₂ ≤ 7) = %d\n', 1 - normcdf(7, 5, 3))
fprintf('1 - P(X₃ ≤ 7) = %d\n', 1 - expcdf(7, 7))

% P(3 ≤ Xk ≤ 3) = P(Xk ≤ 4) - P(Xk ≤ 3)
fprintf('P(3 ≤ X₁ ≤ 4) = %d\n', binocdf(4, 10, 0.3) - binocdf(3, 10, 0.3))
fprintf('P(3 ≤ X₂ ≤ 4) = %d\n', normcdf(4, 5, 3) - normcdf(7, 5, 3))
fprintf('P(3 ≤ X₃ ≤ 4) = %d\n', expcdf(4, 7) - expcdf(3, 7))


%%
% Problem 1 - Probability density functions

%% Problem 1: exp-pdf
dx = 0.1;
x = 0:dx:15; % Creates vector with increments of dx
mu = 1;
y = exppdf(x, mu); % the density function of Exp(mu)
plot(x,y)

%% Problem 1: lambda-plot
lambda = 0.4267;
f=(lambda*exp(-x/lambda)+lambda./x).*(x >= 1 & x <= 10);
plot(x, f)


%%
% Problem 2 - Multivariate normal distribution

%% Problem 2: Multivariate normal
mux = 3; muy = 90; sigmax = 10; sigmay = 30; rho = 0.001;
plot_mvnpdf(mux, muy, sigmax, sigmay, rho)


%%
% Problem 2 - Simulating random numbers

%% Problem 3: Simulating random numbers
mu = 10;
N = 1e4;
y = exprnd(mu, N, 1); % Generates N Exp(mu) random numbers
hist_density(y); % Creates a normalized histogram
t = linspace(0, 100, N/10); % Vector of N/10 points
hold on
plot(t, exppdf(t, mu), 'r') % 'r' means red line
hold off


%%
% Problem 4 - LLN, Monte Carlo and CLT

%% Law of large numbers
mu = 0.5;
M = 500;
X = exprnd(mu, M, 1);
plot(ones(M, 1)*mu, 'r-.')
hold on
for k = 1:M
    plot(k, mean(X(1:k)), '.')
    if k == 1
        legend('True \mu', 'Estimated \mu')
    end
    % xlabel(num2str(k)), pause(0.001)
end
hold off

%% CGS
M = 1e3;
N = 30;
mu = 5;
X = exprnd(mu, M, N);
S = cumsum(X, 2);
for k = 1:N
    hist(S(:, k), 30)
    xlabel(num2str(k))
    pause(0.1)
end


%% Monte Carlo
N = 1e5;
% U = rand(N, 1)*2*pi
% mean(sin(U).^2)

X = exprnd(4, N, 1);
Y = normrnd(0, 1, N, 1);
Z = exp(X).^(cos(Y));
plot(Z)
median(Z)


%%
% Problem 5 - Descriptive statistics
load birth.dat
x = birth(birth(:, 20) < 3, 3);
y = birth(birth(:, 20) == 3, 3);
subplot(2,2,1)
boxplot(x)
axis([0 2 500 5000])
subplot(2,2,2)
boxplot(y)
axis([0 2 500 5000])
subplot(2,2,3:4)
ksdensity(x)
hold on
[fy, ty] = ksdensity(y);
plot(ty, fy, 'r')
hold off
