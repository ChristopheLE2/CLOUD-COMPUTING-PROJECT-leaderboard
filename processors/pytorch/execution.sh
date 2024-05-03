docker import https://hub.docker.com/r/fennecinspace/hackia-torch-fire-classify

docker run -v /home/mohamed/Projects/lbml/leaderboard/media/files/test/test:/code/dataset -v /home/mohamed/Projects/lbml/leaderboard/media/submissions/small_xpection_2023_sidi.pt:/code/model.h5 hackia-torch-fire-classify python /code/script.py -d /code/dataset -m /code/model.pt

docker run -v Resource.name[FIRE_CLASSIFICATION_TEST_DATASET]:/code/dataset -v Submission.file:/code/model.pt fennecinspace/hackia-torch-fire-classify python /code/script.py -d /code/dataset -m /code/model.pt