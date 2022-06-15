while :
do
    # Setup files
    mkdir /tmp/KRR
    mkfifo /tmp/KRR/propipe
    echo start > /tmp/KRR/loop_input
    touch /tmp/KRR/chat_input
    touch /tmp/KRR/chat_output

    # Start Prolog
    export PATH=./gprolog/bin:$PATH
    </tmp/KRR/propipe ./gprolog/bin/gprolog | tee /tmp/KRR/chat_output &
    PROPID=$!

    # Start Loop
    python3 prolog_server/loop.py

    # Cleanup
    rm -rf /tmp/KRR
    kill $PROPID 2> /dev/null
done
