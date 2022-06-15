from typing import Iterable
import streamlit as st
import time

def display_chat_history():
    CHAT_IN = "/tmp/KRR/chat_input"
    CHAT_OUT = "/tmp/KRR/chat_output"

    try:
        with open(CHAT_IN, 'r') as f:
            me_lines = f.readlines()
        
        with open(CHAT_OUT, 'r') as f:
            f.readline()
            rex_lines = f.readlines()

        def rex_gen(rex_lines: Iterable[str]):
            line_buffer = []
            for line in rex_lines:
                l = line.strip()
                if l == ">>>":
                    yield '\n'.join(line_buffer)
                    line_buffer.clear()
                # Code around a weird bug
                elif len(l) > 3 and l[:3] == ">>>":
                    yield '\n'.join(line_buffer)
                    line_buffer.clear()
                    line_buffer.append(l[3:])
                else:
                    line_buffer.append(l)

        me_chat = me_lines[display_chat_history.counter:]
        rex_chat = list(rex_gen(rex_lines))[display_chat_history.counter:]
        for i, j in zip(me_chat, rex_chat):
            st.info(i)
            st.success(j)
            display_chat_history.counter += 1

    except FileNotFoundError:
        pass


ALLOWED_CHARS = set('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-')
def sanitize(s: str) -> str:
    return ''.join(i for i in s if i in ALLOWED_CHARS)
        

def main():
    display_chat_history.counter = 0
    st.title("rEX: Cybersecurity Expert System")
    chat_hist = st.container()
    with chat_hist:
        display_chat_history()

    with st.form("rEX", clear_on_submit=True):
        user_input = st.text_input('rEX')
        submitted = st.form_submit_button("Submit")
        # Every form must have a submit button.
        if submitted:
            sani_input = sanitize(user_input)
            with open('/tmp/KRR/loop_input', 'w') as f:
                f.write(sani_input)
            if sani_input.replace('.', '').lower().strip() == 'restart':
                with st.spinner('Restarting interaction...'):
                    time.sleep(5)
                    st.experimental_rerun()
            time.sleep(1)
            with chat_hist:
                display_chat_history()


if __name__ == "__main__":
    st.set_page_config(
        page_title="rEX",
        page_icon=":sauropod:",
        #layout="wide"
    )
    main()
