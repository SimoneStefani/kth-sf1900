function [] = normplot(mu, sigma, subplt)
    x = -20:.1:20;
    y = normpdf(x, mu, sigma);


    subplot(subplt(1), subplt(2), subplt(3))
    hold on
    plot([-20 20], [0 0], 'k-')
    plot([0 0], [-0.1 0.5], 'k-')
    plot(x,y,'LineWidth',2)
    ylim([-0.1 0.5])
end