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

First you may need to make the install script executable:
```bash
chmod +x install
```

To install copy the cpumon binary into `/usr/local/bin/`:
```
sudo ./install
```
Now it should be possible to run the monitor from anywhere in the system by entering `sudo cpumon`.

### Framework Laptop

Users of the Framework Laptop that want to monitor fan speed also need to install the ectool. They run this command instead:

```bash
sudo ./install f
```

## Uninstall

To uninstall, remove the binaries from `usr/local/bin` with this command:

```bash
sudo ./install remove
```

# Build it yourself

To build the binary from source files this project uses cmake and make.

Create a build directory inside the rootfolder, generate the makefiles and build the project:

```bash
mkdir build
cd build
cmake ..
make
```


# Provide Feedback

Tested with i7-1165G7 on Pop!_OS 22.04._ The application aims to be compatible with a variety of CPUs. If the application doesn't display certain quantities on your system, feel free to submit a screenshot and the cpu model. Maybe I can work out the problem.