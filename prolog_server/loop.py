import time
import os
from typing import List
from pathlib import Path

def get_modules_to_load(dir_name: str) -> List[str]:
    DIR = Path(dir_name)
    return list(str(i) for i in DIR.glob("*.pl"))

if not os.path.exists('/tmp/KRR/propipe'):
    print('Prolog pipe not initialized')
    exit(1)
PROLOG_PIPE = open('/tmp/KRR/propipe', 'w')

for mod in get_modules_to_load('knowledge_base'):
    print(f"consult('{mod}')", end='.\n', file=PROLOG_PIPE, flush=True)

time.sleep(2)
with open('/tmp/KRR/chat_output', 'w') as f:
    pass

while True:
    time.sleep(0.5)
    with open('/tmp/KRR/loop_input', 'r') as f:
        read = f.readline().lower().replace('.', '').replace(' ', '').strip()
        if read == 'restart':
            break
        if len(read) > 0:
            with open('/tmp/KRR/chat_input', 'a') as f:
                f.write(read)
                f.write('\n')
            print(read, end='.\n', file=PROLOG_PIPE, flush=True)
    with open('/tmp/KRR/loop_input', 'w') as f:
        pass
