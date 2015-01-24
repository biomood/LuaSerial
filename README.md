A Lua library for the Arduino written in C
This is using the POSIX library which should work on oUNIX environments.

Using this library you'll be able to send and receive data from the Arduino.
See the arduinotest.lua and arduinotest.ino for an example of sending data to the arduino and then receiving the data back.

Code derived from https://github.com/rtacconi

## requirements

* Lua 5.1.x

## build

    tcc -shared -llua serial.c -o serial.so

## TO USE

    Require the library:
    local serial = require("serial")

Open a connection to an arduino (port is the filedescriptor, msg is error if failed to open)

    port, msg = serial.open("/dev/tty.usbserial-A600agDn", 9600)
    if port==-1 then
      error("Unable to open port - error: "..msg)
    end

Write a string (c is number of bytes written, msg is error if failed)

    c, msg = serial.write(port, "hello")
    if c < 0 then
      error("Unable to write: "..msg)
    end

Read x number of bytes (c is actual number of bytes read, msg is error if failed)

    c, msg = serial.readbytes(port, x)

Close connection

    c, msg = serial.close(port);
