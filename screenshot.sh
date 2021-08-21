#!/bin/sh
cd $(dirname $0)
cd tmp

if [ $(ls -l | wc -l) = 0 ]; then
    echo "no target"
else
    for file in *; do
        ex=${file##*.}
        echo "TARGET: $file"
        if [ $ex = 'mov' ]; then
            echo "> convert '*.mov' to '*.gif' ..."
            convName=$(date +"%Y-%m-%d"-%s).gif
            if [ $1 = '-n' or $1 = '--normal' ]; then
                # 空白対策でコート囲み
                ffmpeg -i "$file" $convName
            else
                # 空白対策でコート囲み
                ffmpeg -i "$file" -filter_complex "[0:v] fps=10,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse=dither=none" $convName
            fi
            mv $convName ../conv/gif
            mv "$file" ../conv/mov
        else
            if [ ! -d ../conv/$ex ]; then
                echo "INITIALIZE: $ex"
                mkdir ../conv/$ex
            fi
            # 空白対策でコート囲み
            mv "$file" ../conv/$ex
        fi
        echo
    done
fi

open $(dirname $0)
