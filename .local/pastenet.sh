pastebin()
{
    local url='https://paste.c-net.org/'
    local logfile='/var/log/paste_c-net.log'
    if (( $# )); then
        local file
        for file; do
            date >> $logfile
            echo "file: $(pwd)/$file" >> $logfile
            curl -s \
                --data-binary @"$file" \
                --header "X-FileName: ${file##*/}" \
                --header "Accept: application/json, */*" \
                "$url" | tee -a $logfile
            echo >> $logfile
        done
    else
        date >> $logfile
        curl -s --header "Accept: application/json, */*" -data-binary @- "$url" | tee -a $logfile
        echo >> $logfile
    fi
}

pasteget()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local arg
        for arg; do
            curl -s "${url}${arg##*/}"
        done
    else
        local arg
        while read -r arg; do
            curl -s "${url}${arg##*/}"
        done
    fi
}

pastedelete () {
    if [ $# -eq 2 ]; then
        local logfile='/var/log/paste_c-net.log'
        date >> $logfile
        echo $1 $2 >> $logfile
        curl -s -X DELETE -H "X-Delete-Key: $2" "https://paste.c-net.org/$1" | tee -a $logfile
        echo >> $logfile
    else
        echo "Usage: pastedelete [UNIQUE_URL_WORDS] [DELETE_KEY]"
    fi
}

