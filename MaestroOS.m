classdef MaestroOS < MaestroInterface
    properties (SetAccess = protected, GetAccess = protected)
       ServoCount
    end
    
    methods (Static)
        function unsafeSystem(cmd)
            [status, msg] = system(cmd);
            assert(status == 0, msg);
        end
    end
    
    methods (Hidden, Static)
        function res = commandBuilder(action, servo, target)
            assert(isnumeric(servo), 'Servo must be a numeric');
            assert(isnumeric(target), 'Target must be a numeric');
            res = sprintf('UscCmd --%s %i, %i', action, servo, target);
        end
    end

    methods
        function gobj = MaestroOS()
        end

        function setTarget(~, servo, target)
            cmd = MaestroOS.commandBuilder('servo', servo, target);
            MaestroOS.unsafeSystem(cmd);
        end
        
        function setAccel(~, servo, target)
            cmd = MaestroOS.commandBuilder('accel', servo, target);
            MaestroOS.unsafeSystem(cmd);
        end
        
        function setSpeed(~, servo, target)
            cmd = MaestroOS.commandBuilder('speed', servo, target);
            MaestroOS.unsafeSystem(cmd);
        end
    end
end
