classdef MaestroRobot < VerboseRobot
    methods (Static)
        function unsafeSystem(cmd)
            [status, msg] = system(cmd);
            assert(status == 0, msg);
        end
    end

    methods
        function gobj = MaestroRobot(servoCount, verbose)
            gobj = gobj@VerboseRobot(verbose);
            if ~exist('servoCount','var')
                gobj.ServoCount = 6;
            else
                assert(isnumeric(servoCount));
                gobj.ServoCount = servoCount;
            end
        end

        function setTarget(obj, servo, target)
            setTarget@VerboseRobot(obj, servo, target);
            command = sprintf('UscCmd --servo %i, %i', servo, target);
            MaestroRobot.unsafeSystem(command);
        end
        
        function setAccel(obj, servo, target)
            setAccel@VerboseRobot(obj, servo, target);
            command = sprintf('UscCmd --accel %i, %i', servo, target);
            MaestroRobot.unsafeSystem(command);
        end
        
        function setSpeed(obj, servo, target)
            setSpeed@VerboseRobot(obj, servo, target);
            command = sprintf('UscCmd --speed %i, %i', servo, target);
            MaestroRobot.unsafeSystem(command);
        end
        
        function goHome(obj)
            goHome@VerboseRobot(obj);
            for n = 0:(obj.ServoCount - 1)
                obj.setTarget(n, 6000);
            end
        end
    end
end
