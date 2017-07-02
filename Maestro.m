classdef Maestro < MaestroInterface
    %MAESTRO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        BaudIndicator = hex2dec('AA')
        DeviceId = hex2dec('c')
    end
    
    methods (Static)
        function res = lsb(x)
            res = binvec2dec(bitget(x, 1:7));
        end
        
        function res = msb(x)
            res = binvec2dec(bitget(x, 8:14));
        end
    end
    
    methods
        function gobj = Maestro(port)
            gobj.Port = serial(port);
            set(gobj.Port, 'InputBufferSize', 2048);
            set(gobj.Port, 'BaudRate', 9600);
            set(gobj.Port, 'DataBits', 8);
            set(gobj.Port, 'Parity', 'none');
            set(gobj.Port, 'StopBits', 1);
            fopen(gobj.Port);
        end
        
        function close(obj)
            fclose(obj.Port);
        end
        
        function sendCommand(obj, cmd)
            cmd = cat(2, [obj.BaudIndicator, obj.DeviceId], cmd);
            fwrite(obj.Port, cmd);
        end
        
        function sendAction(obj, action, chan, target)
            lsb = obj.lsb(target);
            msb = obj.msb(target);
            cmd = [action, chan, lsb, msb];
            obj.sendCommand(cmd);
        end
        
        function setTarget(obj, chan, target)
            obj.sendAction(4, chan, target);
        end
        
        function setSpeed(obj, chan, target)
            obj.sendAction(7, chan, target);
        end
        
        function setAccel(obj, chan, target)
            obj.sendAction(9, chan, target);
        end
    end 
end

