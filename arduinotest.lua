local serial = require("serial")

serialport = "/dev/tty.usbserial-A600agDn"

-- open connection to arduino
port, msg = serial.open(serialport, 9600)
if port==-1 then
	error("Unable to open port - error: "..msg)
end

-- wait a few seconds for the arduino to reset
serial.sleep(2)

-- write value to arduino
c, msg = serial.write(port, "h")
if c < 0 then
	error("Unable to write: "..msg)
end

-- read value back
while true do
	local cc, msg = serial.readbytes(port, 1)
	if cc > 0 then
		print("Echo: "..msg)
		break
	end
end

-- close the connection
c, msg = serial.close(port);
if c < 0 then
	error("Unable to close connection: "..msg);
end