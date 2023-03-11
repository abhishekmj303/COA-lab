import sys
import time
import pyautogui as bot

# Wait times
start_wait = 3
letter_interval = 0.05
enter_interval = 0.5

# Take file name from command line
if len(sys.argv) < 2:
    print('Please provide file name')
    sys.exit(1)
file_name = sys.argv[1]

# Run commands
time.sleep(start_wait)
bot.typewrite('..\\masm ' + file_name + ';\n', letter_interval)
time.sleep(enter_interval)
bot.typewrite('..\\link ' + file_name + ';\n', letter_interval)
time.sleep(enter_interval)
bot.typewrite(file_name + '\n', letter_interval)
