#!/bin/bash

id=0
switch=0
result=0
totalOK=0
totalNG=0
file=result.txt

while true
do
    echo $[$id%100]
    if [[ $[$id%100] -lt 10 ]]
    then
        switch=0
    else
        switch=1
        if [[ $(($id%2)) -eq 0 ]]
        then
            result=1
            let totalOK++
        else
            result=0
            let totalNG++
        fi
    fi

    # 文件是否存在
    if [ ! -e $file ]
    then
        touch $file
    fi

    # 文件是否为空
    if test -s $file; then
        sed -i '1i {"id": '$id', "switch": '$switch', "result": '$result', "totalOK": '$totalOK', "totalNG": '$totalNG'}' $file
    else
        echo "{\"id\": $id, \"switch\": $switch, \"result\": $result, \"totalOK\": $totalOK, \"totalNG\": $totalNG}" >> $file
    fi

    let id++

    sleep 1s
done
