import sys
import time

energy_uj_prv = 0

while True:
    with open("/sys/devices/virtual/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", mode="rb") as bin_file:
        contents = bin_file.read()
        energy_uj = contents

    print("Filesize in Bytes: " , sys.getsizeof(contents))
    print("Energy microjouls", contents[:20])
    print("Energy :", hex(int(energy_uj)))
    power_w = (int(energy_uj) - energy_uj_prv) / 1000000
    print("Leistung [W] =", power_w)
    print("\n")
    
        # Do stuff with byte.


    #print(type(contents))
    energy_uj_prv = int(energy_uj)
    time.sleep(1)