import os
import re
import glob


# Get the data from the log files
data = []

for log_file in glob.glob('build/*/test/solution1/impl/verilog/vivado.log'):
    dir_name = os.path.basename(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(log_file))))))
    print(dir_name)
    with open(log_file, 'r') as f:
        content = f.read()
    cp = re.findall(r'CP achieved post-implementation:\s+([\d\.]+)', content)[-1]
    lut = re.findall(r'LUT:\s+(\d+)', content)[-1]
    ff = re.findall(r'FF:\s+(\d+)', content)[-1]
    bram = re.findall(r'BRAM:\s+(\d+)', content)[-1]
    uram = re.findall(r'URAM:\s+(\d+)', content)[-1]
    clb = re.findall(r'CLB:\s+(\d+)', content)[-1]
    # Place CP before LUT
    data_row = [dir_name] + [cp, lut, ff, bram, uram, clb]
    data.append(data_row)

# Headers
headers = ["Directory", "CP", "LUT", "FF", "BRAM", "URAM", "CLB"]

# Get the maximum width of each column
max_widths = [max([len(str(row[col])) for row in data] + [len(headers[col])]) for col in range(len(data[0]))]

# Print headers
print(', '.join([f"{headers[i]:>{max_widths[i]}}" for i in range(len(headers))]))

# Print the data in the specified format
for row in data:
    print(', '.join([f"{row[i]:>{max_widths[i]}}" for i in range(len(row))]))
