# cpumon
A CLI based cpu monitoring application inspired by Throttlestop.

Cpumon monitors quantities like frequency, load, temperature, voltage and power draw of your CPU.

![cpumon](docs/cpumon.png)

It can be used to investigate CPU-related issues with the system regarding performance or battery life.

The application accesses various parts of sysfs and machine specifiyc registers (MSR) of the CPU.
The [ectool](https://github.com/DHowett/framework-ec) is used to the display the fan speed on the [Framework Laptop](https://frame.work/us). 

# Try out
## Run

To run the CPU monitor directly enter:

```bash
cd bin
sudo ./cpumon
```
Fan speed is only available after install.

## Install

The provided bash script copies the cpumon and ectool binaries into `/usr/local/bin/`.

```bash
chmod +x install.sh
```
```
sudo ./install.sh
```
Now it should be possible to run the monitor from anywhere in the system by entering `sudo cpumon`.

## Uninstall

```bash
sudo ./install.sh remove
```

# Build it yourself

To build the binary from the source files this project uses cmake and make.

First use cmake to generate the makefiles:

```bash
cmake CMakeLists.txt
```

Than build the binary which will be placed in the ./bin directory:
```bash
make
```

# Provide Feedback

Tested with i7-1165G7 on Pop!_OS 22.04._ The application aims to be compatible with a variety of CPUs. If the application doesn't display certain quantities on your system, feel free to submit a screenshot and the cpu model. Maybe I can work out the problem.