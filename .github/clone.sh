#!/bin/bash

# Copyright (C) 2020 by sandy1709

echo "
                    :'######:::::'###::::'########::::
                    '##... ##:::'## ##:::... ##..:::::
                     ##:::..:::'##:. ##::::: ##:::::::
                     ##:::::::'##:::. ##:::: ##:::::::
                     ##::::::: #########:::: ##:::::::
                     ##::: ##: ##.... ##:::: ##:::::::
                    . ######:: ##:::: ##:::: ##:::::::
                    :......:::..:::::..:::::..::::::::
"

echo "
'##::::'##::'######::'########:'########::'########:::'#######::'########:
 ##:::: ##:'##... ##: ##.....:: ##.... ##: ##.... ##:'##.... ##:... ##..::
 ##:::: ##: ##:::..:: ##::::::: ##:::: ##: ##:::: ##: ##:::: ##:::: ##::::
 ##:::: ##:. ######:: ######::: ########:: ########:: ##:::: ##:::: ##::::
 ##:::: ##::..... ##: ##...:::: ##.. ##::: ##.... ##: ##:::: ##:::: ##::::
 ##:::: ##:'##::: ##: ##::::::: ##::. ##:: ##:::: ##: ##:::: ##:::: ##::::
. #######::. ######:: ########: ##:::. ##: ########::. #######::::: ##::::
:.......::::......:::........::..:::::..::........::::.......::::::..:::::
"

if [[ -n $HEROKU_API_KEY && -n $HEROKU_APP_NAME ]]; then
    local herokuErr=$(python ./.github/herokugiturl.py)
    [[ $herokuErr ]] && quit "heroku response > $herokuErr"
    declare -g HEROKU_GIT_URL="https://api:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APP_NAME.git"
fi

FILE=/app/.git

if [ -d "$FILE" ] ; then
    echo "$FILE directory exists already."
else
    if [ -z $HEROKU_GIT_URL ]; then
        gitClone $HEROKU_GIT_URL cat_ub || quit "Invalid HEROKU_API_KEY or HEROKU_APP_NAME var !"
        mv cat_ub/.git .
        rm -rf cat_ub
    else
        git clone -b main https://github.com/sandy1709/catuserbot cat_ub
        mv cat_ub/.git .
        rm -rf cat_ub
    fi
fi

python -m userbot
