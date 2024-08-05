function [fitresult, gof] = createFit_Quadratic(t, w)
%CREATEFIT1(T,W)
%  Create a fit with quadratic fitting
%
%  Data for 'untitled fit 1' fit:
%      X Input : t
%      Y Output: w
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 24-Oct-2022 11:45:02 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t, w );

% Set up fittype and options.
ft = fittype( 'poly2' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'Bisquare';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'w vs. t', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 't' );
% ylabel( 'w' );
% %set(gca,'FontSize',20,'position',[0.10,0.10,0.87,0.18])
% grid on


