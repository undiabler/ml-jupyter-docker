FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g ${GROUP_ID} sci-user &&\
    adduser -u ${USER_ID} --gid ${GROUP_ID} --disabled-password --gecos "" sci-user &&\
    chown --changes --silent --no-dereference --recursive ${USER_ID}:${GROUP_ID} /tf

RUN apt-get update && apt-get install -y --no-install-recommends sudo
RUN echo "sci-user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sci_priviledge

USER sci-user
RUN mkdir /home/sci-user/notebooks
WORKDIR /home/sci-user

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/home/sci-user/notebooks --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=''"]
