import asyncio

from userbot import runcmd


async def update_requirements():
    try:
        await runcmd("pip install --upgrade pip")
        print("Pip is upto-date")
    except BaseException:
        print("Error while updating pip")
    try:
        await runcmd(catcmd)
        print("Succesfully requiremenst are upto-date")
    except BaseException:
        print("Error while installing requirments")


loop = asyncio.get_event_loop()
loop.run_until_complete(update_requirements())
loop.close()
