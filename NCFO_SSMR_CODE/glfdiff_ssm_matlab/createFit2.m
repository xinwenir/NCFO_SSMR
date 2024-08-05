function [fitresult, gof] = createFit2(x, e_w)
%CREATEFIT2(X,E_W)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: e_w
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 02-Nov-2022 11:59:03 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, e_w );

% Set up fittype and options.
ft = 'linearinterp';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'e_w vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel( 'x' );
ylabel( 'e_w' );
grid on


