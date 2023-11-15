classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure     matlab.ui.Figure
        STOPButton   matlab.ui.control.Button
        STARTButton  matlab.ui.control.Button
    end

    
    methods (Access = private)
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: STARTButton
        function STARTButtonPushed2(app, event)
            global ok;
            ok = true;
            start_and_upload();
        end

        % Button pushed function: STOPButton
        function STOPButtonPushed(app, event)
            global ok;
            ok = false;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9922 1 0.949];
            app.UIFigure.Position = [100 100 535 269];
            app.UIFigure.Name = 'MATLAB App';

            % Create STARTButton
            app.STARTButton = uibutton(app.UIFigure, 'push');
            app.STARTButton.ButtonPushedFcn = createCallbackFcn(app, @STARTButtonPushed2, true);
            app.STARTButton.BackgroundColor = [0.6549 0.949 0.8078];
            app.STARTButton.Position = [191 162 155 34];
            app.STARTButton.Text = 'START';

            % Create STOPButton
            app.STOPButton = uibutton(app.UIFigure, 'push');
            app.STOPButton.ButtonPushedFcn = createCallbackFcn(app, @STOPButtonPushed, true);
            app.STOPButton.BackgroundColor = [0.902 0.451 0.451];
            app.STOPButton.Position = [191 96 155 34];
            app.STOPButton.Text = 'STOP';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end