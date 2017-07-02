classdef MaestroOS < VerboseMaestro
    properties (SetAccess = protected, GetAccess = protected)
       ServoCount
    end
    
    methods (Static)
        function unsafeSystem(cmd)
            [status, msg] = system(cmd);
            assert(status == 0, msg);
        end
    end

    methods
        function gobj = MaestroOS(varargin)
            gobj = gobj@VerboseMaestro(true);
            if nargin > 0
                assert(isnumeric(varargin{1}));
                gobj.ServoCount = varargin{1};
            else
                gobj.ServoCount = 6;
            end
        end

        function setTarget(obj, servo, target)
            setTarget@VerboseMaestro(obj, servo, target);
            command = sprintf('UscCmd --servo %i, %i', servo, target);
            MaestroOS.unsafeSystem(command);
        end
        
        function setAccel(obj, servo, target)
            setAccel@VerboseMaestro(obj, servo, target);
            command = sprintf('UscCmd --accel %i, %i', servo, target);
            MaestroOS.unsafeSystem(command);
        end
        
        function setSpeed(obj, servo, target)
            setSpeed@VerboseMaestro(obj, servo, target);
            command = sprintf('UscCmd --speed %i, %i', servo, target);
            MaestroOS.unsafeSystem(command);
        end
        
        function goHome(obj)
            goHome@VerboseMaestro(obj);
            for n = 0:(obj.ServoCount - 1)
                obj.setTarget(n, 6000);
            end
        end
    end
end
