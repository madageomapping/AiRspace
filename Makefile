# charts Makefile
TOP=.

all: update chart_tiler airspace_tiler

update: chart_list_update chart_download chart_shapes_download

chart_list_update: flake8
	python3 src/chart_list_update.py

chart_download: flake8
	python3 src/chart_download.py

chart_shapes_download: flake8
	python3 src/chart_shapes_download.py

chart_tiler: flake8
	python3 src/chart_tiler.py

airspace_tiler: flake8
	python3 src/airspace_tiler.py

flake8:
	flake8 --config $(TOP)/flake8.config src/*.py


install_packages:
	pip3 install pyproj
	pip3 install panda3d
	pip3 install pyshp
	pip3 install affine
	pip3 install shapely
	pip3 install lxml
	pip3 install pillow
	pip3 install redis
	pip3 install numpy
	pip3 install requests
	pip3 install python-dateutil
	pip3 install gdal
	pip3 install opencv-python

.FORCE:

-include Makefile.$(USER)
