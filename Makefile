
.PHONY: docker-build build/venv docker-run docker-clean clean


build/venv:
	mkdir build && python -m venv build/venv && . build/venv/bin/activate && \
      poetry install --without dev


docker-build:
	docker build -t hello-fast-api:latest .


docker-run:
	docker run --name hello-fast-api -p 8080:8080 hello-fast-api:latest

docker-clean:
	docker rm -f hello-fast-api

clean:
	rm -rf build


