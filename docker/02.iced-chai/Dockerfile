FROM 01.drip-coffee

COPY *.sh /iced-chai/
RUN sudo chmod +x -R /iced-chai/

RUN /iced-chai/install.home-manager.sh

ENTRYPOINT ["/iced-chai/entrypoint.sh"]
