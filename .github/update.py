import asyncio
import sys
from os import environ, execle, path, remove

requirements_path = path.join(
    path.dirname(path.dirname(path.dirname(__file__))), "requirements.txt"
)


def update_requirements():
    reqs = str(requirements_path)
    try:
        process = asyncio.create_subprocess_shell(
            " ".join([sys.executable, "-m", "pip", "install", "-r", reqs]),
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
        )
        process.communicate()
        return process.returncode
    except Exception as e:
        return repr(e)


update_requirements()
