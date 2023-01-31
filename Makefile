
.PHONY: test clean docs viewdocs


all: clean format docs type test build

viewdocs:
	firefox ./docs/_build/html/index.html &

docs:
	cd docs; make clean; make html; cd ..

format:
	black ./puissant

type:
	pyright ./puissant/__init__.py

test:
	tox

build:
	python -m build

upload:
	twine upload dist/*


push:
	git add .
	git status
	git commit -m "$(COMMENT)"
	git push

clean:
	rm -rf *~
	rm -rf ./dist
	rm -rf .coverage
	rm -rf ./.tox
	rm -rf ./.pytest_cache
	rm -rf ./puissant/*~
	rm -rf ./puissant/__pycache__
	rm -rf ./docs/*~
	rm -rf ./test/.coverage
	rm -rf ./test/__pycache__
	rm -rf ./test/*~
	rm -rf puissant.egg-info
	rm -rf .mypy_cache
	cd docs; make clean ; cd ..
