function [fitresult, gof] = createFit_Linear(t, w)
%CREATEFIT(T,W)
%  Create a fit with linear fitting
%
%  Data for 'untitled fit 1' fit:
%      X Input : t
%      Y Output: w
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 24-Oct-2022 10:55:09 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t, w );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'w vs. t', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 't' );
% ylabel( 'w' );
% grid on


