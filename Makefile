SHELL=/bin/bash

setup:
	/c/Users/Sansomega/AppData/Local/Programs/Python/Python38/python.exe -m venv .venv
	source .venv/Scripts/activate && pip install -r requirements.txt

run:
	source .venv/Scripts/activate && python app.py

clean:
	rm -rf .venv
	py3clean .