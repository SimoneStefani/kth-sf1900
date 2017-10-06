function [] = gammaplot(A, B, subplt)
    x = 0:.1:20;
    y = gampdf(x, A, B);


    subplot(subplt(1), subplt(2), subplt(3))
    hold on
    plot([0 20], [0 0], 'k-')
    plot([0 0], [-0.1 0.5], 'k-')
    plot(x,y,'LineWidth',2)
    ylim([-0.1 0.5])
end