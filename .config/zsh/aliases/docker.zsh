#
# Defines Docker aliases.
#
# Copyright:
#   François Vantomme <akarzim@gmail.com>
#   https://github.com/akarzim/zsh-docker-aliases
#

#
# Aliases
#

# Docker
alias dk='docker'
alias dka='docker attach'
alias dkb='docker build'
alias dkd='docker diff'
alias dkdf='docker system df'
alias dke='docker exec'
alias dkE='docker exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkh='docker history'
alias dki='docker images'
alias dkin='docker inspect'
alias dkim='docker import'
alias dkk='docker kill'
alias dkkh='docker kill -s HUP'
alias dkl='docker logs'
alias dkL='docker logs -f'
alias dkli='docker login'
alias dklo='docker logout'
alias dkls='docker ps'
alias dkp='docker pause'
alias dkP='docker unpause'
alias dkpl='docker pull'
alias dkph='docker push'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkr='docker run'
alias dkR='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkRe='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkRM='docker system prune'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrn='docker rename'
alias dks='docker start'
alias dkS='docker restart'
alias dkss='docker stats'
alias dksv='docker save'
alias dkt='docker tag'
alias dktop='docker top'
alias dkup='docker update'
alias dkV='docker volume'
alias dkv='docker version'
alias dkw='docker wait'
alias dkx='docker stop'

## Container (C)
alias dkC='docker container'
alias dkCa='docker container attach'
alias dkCcp='docker container cp'
alias dkCd='docker container diff'
alias dkCe='docker container exec'
alias dkCE='docker container exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkCin='docker container inspect'
alias dkCk='docker container kill'
alias dkCl='docker container logs'
alias dkCL='docker container logs -f'
alias dkCls='docker container ls'
alias dkCp='docker container pause'
alias dkCpr='docker container prune'
alias dkCrn='docker container rename'
alias dkCS='docker container restart'
alias dkCrm='docker container rm'
alias dkCr='docker container run'
alias dkCR='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkCRe='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkCs='docker container start'
alias dkCss='docker container stats'
alias dkCx='docker container stop'
alias dkCtop='docker container top'
alias dkCP='docker container unpause'
alias dkCup='docker container update'
alias dkCw='docker container wait'

## Image (I)
alias dkI='docker image'
alias dkIb='docker image build'
alias dkIh='docker image history'
alias dkIim='docker image import'
alias dkIin='docker image inspect'
alias dkIls='docker image ls'
alias dkIpr='docker image prune'
alias dkIpl='docker image pull'
alias dkIph='docker image push'
alias dkIrm='docker image rm'
alias dkIsv='docker image save'
alias dkIt='docker image tag'
alias dkIf='function dkIf_(){ docker images -f "reference=*/*/$1*" -f "reference=*$1*" }; dkIf_'

## Volume (V)
alias dkV='docker volume'
alias dkVin='docker volume inspect'
alias dkVls='docker volume ls'
alias dkVpr='docker volume prune'
alias dkVrm='docker volume rm'

## Network (N)
alias dkN='docker network'
alias dkNs='docker network connect'
alias dkNx='docker network disconnect'
alias dkNin='docker network inspect'
alias dkNls='docker network ls'
alias dkNpr='docker network prune'
alias dkNrm='docker network rm'

## System (Y)
alias dkY='docker system'
alias dkYdf='docker system df'
alias dkYpr='docker system prune'

# Docker Compose (c)
alias dkc='docker-compose'
alias dkcb='docker-compose build'
alias dkcB='docker-compose build --no-cache'
alias dkccp='docker-compose copy'
alias dkccr='docker-compose create'
alias dkccv='docker-compose convert'
alias dkcd='docker-compose down'
alias dkce='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkcev='docker-compose events'
alias dkci='docker-compose images'
alias dkck='docker-compose kill'
alias dkcl='docker-compose logs'
alias dkcL='docker-compose logs -f'
alias dkcls='docker-compose ls'
alias dkcp='docker-compose pause'
alias dkcP='docker-compose unpause'
alias dkcpl='docker-compose pull'
alias dkcph='docker-compose push'
alias dkcpo='docker-compose port'
alias dkcps='docker-compose ps'
alias dkcr='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkcR='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
alias dkcrm='docker-compose rm'
alias dkcs='docker-compose start'
alias dkcsc='docker-compose scale'
alias dkcS='docker-compose restart'
alias dkct='docker-compose top'
alias dkcu='docker-compose up'
alias dkcU='docker-compose up -d'
alias dkcv='docker-compose version'
alias dkcx='docker-compose stop'
