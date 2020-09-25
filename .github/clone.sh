FILE= .git
if [ -d "$FILE" ]
then
    echo "$FILE directory exists already."
else
  git clone -b main https://github.com/sandy1709/catuserbot catt
  mv catt/.git .git
  rm -rf catt
fi

python -m userbot
