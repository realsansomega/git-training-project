SHELL=/bin/bash

setup:
	/c/Users/Sansomega/AppData/Local/Programs/Python/Python38/python.exe -m venv .venv
	source .venv/Scripts/activate && pip install -r requirements.txt
	echo "#!/bin/bash" > .git/hooks/post-commit
	echo "source .venv/Scripts/activate && python ./scripts/post-commit.py" >> .git/hooks/post-commit
	chmod +x .git/hooks/post-commit

run:
	source .venv/Scripts/activate && python app.py

clean:
	rm -rf .venv
	rm -rf __pycache__